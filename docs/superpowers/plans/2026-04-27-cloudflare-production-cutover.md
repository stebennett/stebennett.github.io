# Cloudflare Production Cutover Implementation Plan

**Status:** Completed 2026-04-27. See "Completion Notes" below.

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

## Completion Notes

- **Stage 1 (Task 1):** Verified on `https://beta-preview.stevebennett-prod.pages.dev/`. ✅
- **Stage 2 (Tasks 2–6):** PR #99 closed; PR #107 opened, squash-merged. `pages.yml` auto-merged cleanly (no conflict editor needed — Task 5 skipped). Live site verified on `stevebennett.co`. ✅
- **Stage 3 (Tasks 7–8):** PR #108 squash-merged. Preview deploys confirmed on `stevebennett-prod` via sticky comment URL. ✅
- **Stage 4 (Tasks 9, 11–15):** PR #109 squash-merged (`beta-pages.yml` removed). `beta` branch, `beta.stevebennett.co` DNS, `stevebennett-beta` CF project, and `beta-preview` deployments all deleted. ✅
- **Stage 4 Task 10 — DEFERRED:** `gh api -X DELETE repos/.../pages` returns HTTP 422: "Deactivating GitHub pages for this repository is not allowed." User-page repos (`<user>.github.io`) cannot be disabled via API, and the web UI no longer offers an "Unpublish site" option. Will be addressed by renaming the repo away from `stebennett.github.io` as a follow-up.
- **Bonus fix outside plan scope:** `www.stevebennett.co` was returning HTTP 522 — root cause was the hostname being CNAME'd to `stevebennett-prod.pages.dev` but never registered as a Custom Domain on the CF Pages project. Added during the final sweep.

**Goal:** Promote the new Tailwind theme from `beta` to production at `stevebennett.co` via Cloudflare Pages, retire the `beta` infrastructure, and keep PR previews working.

**Architecture:** `origin/main` already deploys to Cloudflare Pages project `stevebennett-prod` via `.github/workflows/pages.yml`, but its build is missing the Node/Tailwind step needed by the new theme. We will (1) verify the new theme on a CF preview branch, (2) merge `beta` → `main` resolving `pages.yml` to keep the CF deploy step from `main` AND add the Node + `npm ci` step from `beta`, (3) repoint `pr.yml` from `stevebennett-beta` to `stevebennett-prod`, then (4) decommission the beta workflow, branch, CF project, and DNS record. GitHub Pages is no longer in the serving path.

**Tech Stack:** Hugo 0.159.1 extended, Tailwind CSS v4, Node 22, GitHub Actions, `cloudflare/pages-action@v1`, Cloudflare Pages, Cloudflare DNS.

**Spec:** `docs/superpowers/specs/2026-04-27-cloudflare-production-cutover-design.md`

---

## File Inventory

- Modify: `.github/workflows/pages.yml` (on `main` after merge — must contain both CF deploy and Node/Tailwind setup)
- Modify: `.github/workflows/pr.yml` (project → `stevebennett-prod`, branches → `["main"]`)
- Delete: `.github/workflows/beta-pages.yml`
- Untouched code: all `content/`, `layouts/`, `assets/`, `go.mod`, etc. — already on `beta`, will arrive via merge.

External resources touched:
- GitHub repo Settings → Pages (disable)
- GitHub branch `beta` (delete remote + local)
- Cloudflare Pages project `stevebennett-prod` → preview branch `beta-preview` (create then delete)
- Cloudflare Pages project `stevebennett-beta` (delete)
- Cloudflare DNS record `beta.stevebennett.co` (delete)
- Stale PR #99 (close)

---

## Stage 1 — Pre-merge verification on a CF preview URL

### Task 1: Push `beta` HEAD as a preview branch into `stevebennett-prod`

**Goal:** Get a production-like build of the Tailwind theme onto a non-`main` branch of the `stevebennett-prod` CF project so we can eyeball it before cutover. The cleanest way is a one-shot manual CF deploy via `wrangler` from a local Hugo build, because adding a temporary GitHub workflow risks deploying to the wrong branch.

**Files:** none modified in repo.

- [ ] **Step 1: Confirm Cloudflare credentials are available locally**

```bash
# Either source from 1Password / shell profile, or paste from CF dashboard
# (Account → API Tokens; needs Pages:Edit on the account)
echo "${CLOUDFLARE_API_TOKEN:?missing}" | head -c 4 ; echo "..."
echo "${CLOUDFLARE_ACCOUNT_ID:?missing}" | head -c 4 ; echo "..."
```
Expected: each prints a 4-char prefix and "...". If either errors, set the env var before continuing.

- [ ] **Step 2: Check out `beta` and confirm clean state**

```bash
git fetch origin
git checkout beta
git pull --ff-only origin beta
git status
```
Expected: `On branch beta`, `Your branch is up to date with 'origin/beta'.`, working tree clean.

- [ ] **Step 3: Build the site locally with the production baseURL**

```bash
rm -rf public
npm ci
hugo --logLevel info --minify --baseURL "https://stevebennett.co/"
ls public/index.html
```
Expected: `npm ci` succeeds, `hugo` prints "Pages: ..." summary, `public/index.html` exists.

- [ ] **Step 4: Deploy `public/` to `stevebennett-prod` on branch `beta-preview` via wrangler**

```bash
npx wrangler@latest pages deploy public \
  --project-name stevebennett-prod \
  --branch beta-preview \
  --commit-dirty=true
```
Expected: wrangler prints a deployment URL of the form `https://<hash>.stevebennett-prod.pages.dev` and an alias `https://beta-preview.stevebennett-prod.pages.dev`.

Note: wrangler will prompt for the API token / account ID if env vars aren't picked up; paste them in.

- [ ] **Step 5: Smoke-check the preview URL in a browser**

Open `https://beta-preview.stevebennett-prod.pages.dev/` and verify:
- Homepage renders with Tailwind styling and shows highlighted posts.
- An individual post page (`/posts/<any-slug>/`) renders.
- `/posts/` archive page lists posts.
- `/about/` (or equivalent about page) renders.
- Dark mode toggle works and persists across reload.
- `/index.xml` (RSS) returns valid XML (view source).
- No 404s or unstyled fallback in DevTools Network tab on the homepage.

If any of the above fail, **stop**. Fix on `beta` (separate commits/PRs against `beta`), redeploy with Step 4, and re-verify before proceeding to Stage 2.

- [ ] **Step 6: Record preview URL for use in cleanup**

Note the deployment URL and the branch name `beta-preview` — Task 14 will delete the branch deploy from the CF dashboard.

---

## Stage 2 — Merge `beta` → `main`

### Task 2: Close stale PR #99

**Files:** none.

- [ ] **Step 1: Close PR #99 with a note**

```bash
gh pr close 99 --comment "Superseded by a fresh \`beta\` → \`main\` PR opened for the Cloudflare production cutover (see plan docs/superpowers/plans/2026-04-27-cloudflare-production-cutover.md)."
```
Expected: `gh` confirms PR closed.

### Task 3: Open a fresh `beta` → `main` PR

**Files:** none yet — this just opens the PR.

- [ ] **Step 1: Push current `beta` (in case it's ahead of origin)**

```bash
git checkout beta
git push origin beta
```
Expected: either "Everything up-to-date" or a successful push.

- [ ] **Step 2: Create the PR**

```bash
gh pr create --base main --head beta \
  --title "Cloudflare production cutover: promote Tailwind theme to main" \
  --body "$(cat <<'EOF'
## Summary
Promotes the new Tailwind theme from \`beta\` to \`main\`, deploying to Cloudflare Pages project \`stevebennett-prod\` (the one already serving \`stevebennett.co\`).

## Plan
See \`docs/superpowers/plans/2026-04-27-cloudflare-production-cutover.md\` and \`docs/superpowers/specs/2026-04-27-cloudflare-production-cutover-design.md\`.

## Pre-merge verification
Verified on \`https://beta-preview.stevebennett-prod.pages.dev/\` (Stage 1 of the plan).

## Conflict resolution
\`pages.yml\` is the only file expected to conflict. Resolution: keep \`main\`'s Cloudflare deploy step (project \`stevebennett-prod\`, baseURL \`https://stevebennett.co/\`), add \`beta\`'s Node 22 + \`npm ci\` step before the Hugo build.

## Test plan
- [ ] CI workflow on the merge commit succeeds and deploys to \`stevebennett-prod\`.
- [ ] \`https://stevebennett.co/\` shows the new Tailwind theme within 5 min of merge.
- [ ] No \`pages: write\` / \`id-token: write\` permissions in any workflow.
EOF
)"
```
Expected: `gh` prints a PR URL. Save the PR number for Step 6.

### Task 4: Resolve the `pages.yml` conflict locally

**Files:**
- Modify: `.github/workflows/pages.yml`

- [ ] **Step 1: Start the merge locally on a temp branch**

```bash
git checkout main
git pull --ff-only origin main
git checkout -b merge/beta-into-main
git merge --no-ff --no-commit beta
```
Expected: git reports a conflict in `.github/workflows/pages.yml` (and possibly nothing else). If other files conflict, **stop and inspect** before proceeding.

- [ ] **Step 2: Replace `.github/workflows/pages.yml` with the resolved version**

Overwrite the file with exactly:

```yaml
name: Deploy Hugo site to Cloudflare Pages

on:
  push:
    branches: ["main"]

  workflow_dispatch:

permissions:
  contents: read

# Allow one concurrent deployment
concurrency:
  group: "pages"
  cancel-in-progress: true

defaults:
  run:
    shell: bash

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    env:
      HUGO_VERSION: 0.159.1
    steps:
      - name: Install Hugo CLI
        run: |
          wget -O ${{ runner.temp }}/hugo.deb https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_linux-amd64.deb \
          && sudo dpkg -i ${{ runner.temp }}/hugo.deb
      - name: Checkout
        uses: actions/checkout@v6
        with:
          submodules: recursive
      - name: Update .netrc
        run: |
          echo "machine github.com login ${{ secrets.GH_AUTH_TOKEN }} password x-oauth-basic" > $HOME/.netrc
      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '22'
          cache: 'npm'
      - name: Install npm dependencies
        run: npm ci
      - name: Build with Hugo
        env:
          HUGO_ENVIRONMENT: production
          HUGO_ENV: production
        run: |
          hugo \
            --logLevel info \
            --minify \
            --baseURL "https://stevebennett.co/"
      - name: Deploy to Cloudflare Pages
        uses: cloudflare/pages-action@v1
        with:
          apiToken: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          accountId: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
          projectName: stevebennett-prod
          directory: ./public
          branch: main
```

- [ ] **Step 3: Verify no GH Pages references and project name is correct**

```bash
grep -nE "configure-pages|upload-pages-artifact|deploy-pages|pages: write|id-token: write" .github/workflows/pages.yml
```
Expected: no matches.

```bash
grep -n "projectName\|baseURL\|node-version\|npm ci" .github/workflows/pages.yml
```
Expected:
- exactly one `projectName: stevebennett-prod`
- exactly one `--baseURL "https://stevebennett.co/"`
- exactly one `node-version: '22'`
- exactly one `run: npm ci`

- [ ] **Step 4: Mark conflict resolved and inspect the merge**

```bash
git add .github/workflows/pages.yml
git status
git diff --cached .github/workflows/pages.yml | head -80
```
Expected: `pages.yml` shown as modified, no remaining unmerged paths.

- [ ] **Step 5: Verify no other surprise conflicts**

```bash
git diff --check
git status --short
```
Expected: no `UU` rows, no `<<<<<<<` markers.

- [ ] **Step 6: Complete the merge commit**

```bash
git commit -m "Merge branch 'beta' into main: Cloudflare production cutover"
```
Expected: merge commit created. Note the SHA.

- [ ] **Step 7: Push the temp branch and fast-forward `main` via PR merge**

We do NOT push directly to `main`. Instead update the PR from Task 3 to use the resolved tree:

```bash
# Force the PR's source branch (beta) to include this exact merge result is wrong —
# instead, push the merged main and use the existing PR as the merge vehicle by
# rebasing/replacing only if needed. The simplest path:
#
# Option A (preferred): abort our local merge and let GitHub do the merge via PR.
git checkout main
git branch -D merge/beta-into-main
```

If `pages.yml` is the only conflict and we are confident in the resolution, prefer **Option A** (Task 5).

If GitHub's web merge cannot resolve the conflict (it will, for a single text file, by offering the conflict editor), fall back to **Option B**: push `merge/beta-into-main` and open a PR `merge/beta-into-main` → `main`, close the `beta` → `main` PR, then merge.

### Task 5: Resolve the conflict in the PR (Option A — preferred)

**Files:**
- Modify: `.github/workflows/pages.yml` via GitHub web conflict editor

- [ ] **Step 1: Open the PR's conflict resolution view**

```bash
gh pr view --web
```
Click "Resolve conflicts".

- [ ] **Step 2: Replace the conflicted `pages.yml` with the resolved content from Task 4 Step 2**

Paste the exact YAML from Task 4 Step 2 into the editor, removing all `<<<<<<<`, `=======`, `>>>>>>>` markers.

- [ ] **Step 3: Mark resolved and commit**

Click "Mark as resolved", then "Commit merge".

- [ ] **Step 4: Re-run the same checks as Task 4 Step 3, locally**

```bash
git fetch origin
git show origin/beta:.github/workflows/pages.yml | grep -nE "configure-pages|upload-pages-artifact|deploy-pages|pages: write|id-token: write" || echo OK_no_gh_pages
git show origin/beta:.github/workflows/pages.yml | grep -n "projectName\|baseURL\|node-version\|npm ci"
```
Expected: `OK_no_gh_pages` printed, and the project/baseURL/node/npm lines all present exactly once.

(Why `origin/beta`: the GitHub conflict editor commits the resolved file onto the PR's head branch, which is `beta`.)

### Task 6: Merge the PR

**Files:** none directly.

- [ ] **Step 1: Watch CI on the PR head pass first**

```bash
gh pr checks --watch
```
Expected: all checks green. (Note: `pr.yml` will run and try to deploy to `stevebennett-beta` — that's fine for now, Stage 3 fixes it.)

- [ ] **Step 2: Merge with a merge commit (preserve history)**

```bash
gh pr merge --merge --delete-branch=false
```
Expected: PR merged. **Do not** delete `beta` here yet — Stage 4 does that explicitly after decommission tasks.

- [ ] **Step 3: Watch the production deploy run**

```bash
gh run watch $(gh run list --workflow pages.yml --branch main --limit 1 --json databaseId --jq '.[0].databaseId')
```
Expected: workflow succeeds, "Deploy to Cloudflare Pages" step prints a deployment URL like `https://<hash>.stevebennett-prod.pages.dev` aliased to `stevebennett.co`.

- [ ] **Step 4: Smoke-check live site**

In a fresh browser tab (cache disabled in DevTools) open `https://stevebennett.co/` and verify the same checklist as Stage 1 Step 5: Tailwind-styled homepage, post page, archive, about, dark mode, RSS, no broken assets.

If broken, **execute the rollback** (see "Rollback" section at end of plan). Otherwise continue to Stage 3.

---

## Stage 3 — Repoint PR previews to `stevebennett-prod`

### Task 7: Update `pr.yml` to deploy previews to prod project

**Files:**
- Modify: `.github/workflows/pr.yml`

- [ ] **Step 1: Pull latest `main`**

```bash
git checkout main
git pull --ff-only origin main
git checkout -b chore/pr-previews-to-prod
```

- [ ] **Step 2: Edit `.github/workflows/pr.yml`**

Change exactly two things:

In the `on:` block:
```yaml
  pull_request:
    branches: ["main", "beta"]
```
becomes:
```yaml
  pull_request:
    branches: ["main"]
```

In the `Deploy preview to Cloudflare Pages` step:
```yaml
          projectName: stevebennett-beta
```
becomes:
```yaml
          projectName: stevebennett-prod
```

- [ ] **Step 3: Verify the diff**

```bash
git diff .github/workflows/pr.yml
```
Expected: exactly two changed lines — the `branches:` array and the `projectName:` value. Nothing else.

- [ ] **Step 4: Commit and push**

```bash
git add .github/workflows/pr.yml
git commit -m "chore(ci): point PR previews to stevebennett-prod project"
git push -u origin chore/pr-previews-to-prod
```

- [ ] **Step 5: Open the PR**

```bash
gh pr create --base main --fill
```

### Task 8: Verify preview deploy lands on `stevebennett-prod`

**Files:** none.

- [ ] **Step 1: Watch the PR preview workflow on the PR from Task 7**

```bash
gh pr checks --watch
```
Expected: `PR Build & Preview` workflow passes. The sticky-comment from `marocchino/sticky-pull-request-comment` posts a `🔍 Preview deployed: <url>` comment.

- [ ] **Step 2: Verify the preview URL is on the prod project**

```bash
gh pr view --json comments --jq '.comments[].body' | grep -o 'https://[^ ]*pages.dev[^ ]*'
```
Expected: a URL of the form `https://pr-<N>.stevebennett-prod.pages.dev`. The hostname must contain `stevebennett-prod`, NOT `stevebennett-beta`.

- [ ] **Step 3: Open the preview URL and confirm it renders the Tailwind site**

Visual sanity only — homepage loads with Tailwind styling.

- [ ] **Step 4: Merge the PR**

```bash
gh pr merge --merge --delete-branch
```

---

## Stage 4 — Decommission

### Task 9: Delete `beta-pages.yml` from `main`

**Files:**
- Delete: `.github/workflows/beta-pages.yml`

- [ ] **Step 1: Branch and delete**

```bash
git checkout main
git pull --ff-only origin main
git checkout -b chore/decommission-beta-workflow
# beta-pages.yml arrived on main via the Stage 2 merge; delete it
git rm .github/workflows/beta-pages.yml
git status
```
Expected: `beta-pages.yml` shown as deleted, no other changes.

- [ ] **Step 2: Commit and push**

```bash
git commit -m "chore(ci): remove beta-pages workflow"
git push -u origin chore/decommission-beta-workflow
```

- [ ] **Step 3: Open and merge PR**

```bash
gh pr create --base main --fill
gh pr checks --watch
gh pr merge --merge --delete-branch
```
Expected: PR merges, `pages.yml` re-runs against the new `main` and redeploys (no-op effectively but expected). Watch it succeed:

```bash
gh run watch $(gh run list --workflow pages.yml --branch main --limit 1 --json databaseId --jq '.[0].databaseId')
```

### Task 10: Disable GitHub Pages in repo settings

**Files:** none (GitHub UI / API action).

- [ ] **Step 1: Disable Pages via the API**

```bash
gh api -X DELETE repos/stebennett/stebennett.github.io/pages
```
Expected: HTTP 204. (If 404, Pages was already disabled — fine.)

- [ ] **Step 2: Confirm**

```bash
gh api repos/stebennett/stebennett.github.io/pages 2>&1 | head -5
```
Expected: a `404 Not Found` / "Not Found" response confirming Pages is no longer configured.

### Task 11: Delete the `beta` branch

**Files:** none.

- [ ] **Step 1: Confirm `beta` is fully merged into `main`**

```bash
git fetch --prune origin
git log origin/main..origin/beta --oneline
```
Expected: empty output (every `beta` commit is in `main`). If non-empty, **stop** and investigate before deleting.

- [ ] **Step 2: Delete remote and local `beta`**

```bash
git push origin --delete beta
git branch -D beta 2>/dev/null || true
```
Expected: remote deletion confirmed; local delete may say "not found" if you don't have a local `beta` (fine).

### Task 12: Remove `beta.stevebennett.co` DNS record

**Files:** none (Cloudflare dashboard).

- [ ] **Step 1: In Cloudflare → DNS → Records, locate `beta.stevebennett.co`**

It will be a CNAME pointing at `stevebennett-beta.pages.dev` (or similar).

- [ ] **Step 2: Delete the record**

Click the row → Delete → confirm.

- [ ] **Step 3: Verify DNS no longer resolves**

```bash
dig +short beta.stevebennett.co
```
Expected: empty output (or NXDOMAIN). Cloudflare propagation is near-instant on their own DNS.

### Task 13: Delete the `stevebennett-beta` Cloudflare Pages project

**Files:** none (Cloudflare dashboard).

- [ ] **Step 1: In Cloudflare → Workers & Pages → `stevebennett-beta` → Settings**

Scroll to "Delete project". Type project name to confirm. Delete.

- [ ] **Step 2: Verify**

```bash
curl -sI https://stevebennett-beta.pages.dev | head -1
```
Expected: a 404 or NXDOMAIN-equivalent response (no longer 200 OK with content).

### Task 14: Delete the `beta-preview` branch deploy on `stevebennett-prod`

**Files:** none (Cloudflare dashboard).

- [ ] **Step 1: In Cloudflare → Workers & Pages → `stevebennett-prod` → Deployments**

Filter by branch `beta-preview`. Find the deployment created in Task 1.

- [ ] **Step 2: Delete the deployment(s) for that branch**

Use the row's "..." menu → Delete deployment for each entry on `beta-preview`. Cloudflare doesn't have a "delete branch" concept; deleting all its deployments is sufficient.

- [ ] **Step 3: Verify**

```bash
curl -sI https://beta-preview.stevebennett-prod.pages.dev | head -1
```
Expected: 404 or non-200.

### Task 15: Final post-cutover sanity sweep

**Files:** none.

- [ ] **Step 1: Confirm only one workflow remains for deploys**

```bash
ls .github/workflows/
```
Expected: `notes-autopr.yml`, `pages.yml`, `pr.yml` — and **no** `beta-pages.yml`.

- [ ] **Step 2: Confirm `main` workflow files are clean of GH Pages remnants**

```bash
grep -rnE "configure-pages|upload-pages-artifact|deploy-pages|pages: write|id-token: write" .github/workflows/ || echo OK_clean
```
Expected: `OK_clean`.

- [ ] **Step 3: Live site final check**

```bash
curl -sI https://stevebennett.co/ | grep -iE 'server|cf-ray|content-type'
```
Expected: a `cf-ray:` header confirming Cloudflare is serving, and `content-type: text/html`.

Visual check `https://stevebennett.co/` once more — Tailwind theme present.

---

## Rollback

If Stage 2 produces a broken live site:

```bash
git checkout main
git pull --ff-only origin main
git revert -m 1 <merge-commit-sha>   # SHA from Task 6 Step 2
git push origin main
gh run watch $(gh run list --workflow pages.yml --branch main --limit 1 --json databaseId --jq '.[0].databaseId')
```

Expected: workflow re-runs against the reverted state and restores the previous (old-theme) deployment to `stevebennett-prod`. Then triage offline on `beta`.

There is no DNS rollback path — GitHub Pages is no longer in the serving path for `stevebennett.co`.

## Risks (carried from spec)

1. **`pages.yml` resolution gets a value wrong.** Mitigation: Task 4 Step 3 / Task 5 Step 4 grep checks; first-run watch in Task 6 Step 3.
2. **Tailwind build secrets missing on `main` runs.** Mitigation: same secrets (`GH_AUTH_TOKEN`, `CLOUDFLARE_API_TOKEN`, `CLOUDFLARE_ACCOUNT_ID`) are already proven by `pr.yml` and `beta-pages.yml`.
3. **Stage 1 preview branch lingers on `stevebennett-prod`** — Task 14 cleans up.
