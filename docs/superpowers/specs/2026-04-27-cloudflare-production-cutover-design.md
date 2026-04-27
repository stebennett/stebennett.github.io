# Cloudflare Production Cutover — Design

**Date:** 2026-04-27
**Status:** Completed 2026-04-27 (except disable-GitHub-Pages step — see plan Task 10 deferral)

## Context

The new Tailwind theme has been developed on the `beta` branch (PRs #98–#105, all merged into `beta`). It is currently deployed to the Cloudflare Pages project `stevebennett-beta` at `beta.stevebennett.co`.

`main` still carries the old external-theme content but its `pages.yml` workflow was already rewired by PR #97 to deploy to a Cloudflare Pages project named `stevebennett-prod`.

DNS investigation on 2026-04-27 (`dig stevebennett.co`) confirmed:

- `stevebennett.co` apex resolves to Cloudflare anycast IPs.
- `www.stevebennett.co` is a CNAME to `stevebennett-prod.pages.dev`.
- The domain's nameservers are Cloudflare's.
- The live site is currently served by the `stevebennett-prod` CF project, but with the **old theme** build (no Tailwind, old `style.css`, old markup).

GitHub Pages is no longer in the serving path for `stevebennett.co`. There is no DNS rollback target.

## Goal

Promote the new Tailwind theme to production at `stevebennett.co`, retire the `beta` infrastructure, and keep PR preview deploys working via Cloudflare.

## End State

**Workflows**

- `.github/workflows/pages.yml` — push to `main`. Builds Hugo + Tailwind (Node 22, `npm ci`), deploys to CF project `stevebennett-prod`, branch `main`. Produces `stevebennett.co`.
- `.github/workflows/pr.yml` — pull requests to `main` only. Same build, deploys to `stevebennett-prod` as branch `pr-${PR#}`. Sticky-comments preview URL on PR.
- `.github/workflows/beta-pages.yml` — **deleted**.

**Branches:** `main` only. `beta` deleted (local and remote).

**Cloudflare projects:** `stevebennett-prod` only. `stevebennett-beta` deleted.

**DNS:** `stevebennett.co` and `www.stevebennett.co` continue to point at `stevebennett-prod` (no change). `beta.stevebennett.co` record removed.

**GitHub Pages:** disabled in repo Settings → Pages. No `pages: write` / `id-token: write` permissions or GH-Pages-specific actions in any workflow.

## Cutover Plan

### Stage 1 — Pre-merge verification on a preview URL

The `stevebennett.co` apex is already bound to `stevebennett-prod`, so any deploy to that project's `main` branch is immediately public. To verify the new theme before that happens:

- Trigger a Cloudflare branch deploy of the current `beta` branch HEAD into the `stevebennett-prod` project under a non-`main` branch name (e.g. `beta-preview`). This produces a `beta-preview.stevebennett-prod.pages.dev` URL with a production-like build.
- Build with `--baseURL "https://stevebennett.co/"` (matches what the merged workflow will use).
- Visual check on the preview URL: homepage with highlighted posts, an article page, archive page, about page, dark mode toggle, RSS feed, no broken assets.

### Stage 2 — Merge `beta` → `main`

- Close the stale PR #99 (large, outdated diff).
- Open a fresh PR `beta` → `main`.
- Resolve the `pages.yml` conflict by hand. The merged file must contain:
  - Beta's Node 22 setup + `npm ci` step (required for Tailwind build).
  - Main's `projectName: stevebennett-prod`.
  - `--baseURL "https://stevebennett.co/"`.
  - No `pages: write` / `id-token: write` permissions and no `actions/configure-pages`, `actions/upload-pages-artifact`, `actions/deploy-pages` references.
- Eyeball the resolved `pages.yml` before merging.
- Merge. The workflow runs against the merge commit and deploys the new theme to `stevebennett.co`.
- Smoke-check the live site within a few minutes of the workflow completing.

### Stage 3 — Repoint PR previews

- Edit `.github/workflows/pr.yml`:
  - `projectName: stevebennett-beta` → `stevebennett-prod`.
  - `branches: ["main", "beta"]` → `branches: ["main"]`.
- Open a throwaway PR to confirm the preview deploy lands on `stevebennett-prod` and the sticky preview-URL comment appears.

### Stage 4 — Decommission

- Delete `.github/workflows/beta-pages.yml`.
- Disable GitHub Pages in repo Settings → Pages.
- Delete the `beta` branch (local and remote).
- Remove the `beta.stevebennett.co` DNS record from Cloudflare.
- Delete the `stevebennett-beta` Cloudflare Pages project.
- Delete the Stage 1 preview branch deploy (e.g. `beta-preview`) from the `stevebennett-prod` project.
- Close PR #99 with a note that it was superseded by the fresh merge.

## Rollback

If Stage 2 produces a broken live site, revert the merge commit on `main`. The workflow re-runs against the reverted state and restores the previous (old-theme) deployment.

There is no DNS rollback path — GitHub Pages is no longer in the serving path for `stevebennett.co`.

## Risks

1. **`pages.yml` conflict resolution gets a value wrong** (project name, baseURL, or missing Node/Tailwind step). Mitigation: hand-resolve, eyeball, watch first run.
2. **Tailwind build secrets missing on `main` runs.** Mitigation: same secrets (`GH_AUTH_TOKEN`, `CLOUDFLARE_API_TOKEN`, `CLOUDFLARE_ACCOUNT_ID`) are already proven by `pr.yml` and `beta-pages.yml`.
3. **Cached references to `stebennett.github.io`** continue to work until GH Pages is disabled; no action.
4. **Stage 1 preview branch lingers on `stevebennett-prod`** after cutover. Mitigation: delete the branch deploy from CF dashboard during Stage 4.

## Out of Scope

- Content changes.
- Theme tweaks.
- Hugo/Go version bumps (#73, #74).
- Renovate PR #106.
- Backlog items #75, #76, #77, #78.
