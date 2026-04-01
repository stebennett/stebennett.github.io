# New Theme Implementation Plan

## Context

The site currently depends on an external Hugo module (`stebennett/stevebennett-theme` v1.3.0, which wraps `nodejh/hugo-theme-mini`). This makes iteration slow — every change requires a separate repo, release, and module update. The theme also renders homepage sections (work history tabs, community boxes, contact form) that are no longer wanted.

**Goal:** Replace the external theme with a new inline theme built on Tailwind CSS. The design is an editorial blog inspired by sites like Rands in Repose — full articles on the homepage, a sidebar with bio and community promotion, and a distinctive emerald green accent colour.

**Reference mockups:** `mockups/homepage.html` and `mockups/article.html` are the approved visual direction.

## Design Decisions

| Decision | Choice |
|---|---|
| Theme location | Inline in this repo (`layouts/`, `assets/`) — no external module |
| CSS framework | Tailwind CSS via Hugo Pipes + PostCSS |
| Tailwind version | Try v4 with `@tailwindcss/postcss`; fall back to v3.4 if incompatible |
| Typography plugin | `@tailwindcss/typography` — `prose` classes for article content |
| Dark mode | `class` strategy on `<html>`, OS preference by default, manual toggle with localStorage override |
| Accent colour | Emerald green `#0d9373` (hover: `#0b7d62`, light: `#e6f7f2`, dark: `#134e3f`) |
| Fonts | Newsreader (serif, article body) + Inter (sans, UI/headings) via Google Fonts |
| Layout | Two-column: main content + 280px sidebar, max-width 6xl (1152px) |
| Background | `stone-50` light / `zinc-950` dark |

## Page Structure

### Homepage (`layouts/index.html`)
- **Full articles** for the 5 most recent "highlighted" posts (not truncated, no "read more")
- Posts will need a frontmatter field (e.g. `highlighted: true`) to select which appear on the homepage
- Each article shows: **category/topic label** above the title, title (linked), date + reading time, then the full rendered content
- Articles separated by horizontal rules
- No pagination on the homepage itself
- Sidebar (scrolls with page, not sticky):
  - Short bio card: avatar, name, "Engineering Leader" tagline, short bio paragraph, "More about Steve" link
  - Slack community card: logo, title, description, green CTA button linking to engmanagers.github.io

### Article page (`layouts/_default/single.html`)
- Same two-column layout with sidebar
- **Category/topic label** above the title
- Title (serif, large), date + reading time + word count metadata
- Full article content with `prose dark:prose-invert` typography
- Tags as green pills below the article
- Short author bio card at the bottom (avatar, name, tagline, short bio, "More about Steve" link)
- Sidebar: same bio card + Slack community card as homepage

### Archive page (`layouts/_default/list.html`)
- Full list of all posts, grouped by year
- Each entry: date + title link
- Linked from "Archive" in the nav bar

### About page
- Full bio (from `params.shortBio` or a dedicated content page)
- Avatar, social links
- Bio moved here from the homepage — homepage only has the short sidebar version

### Notes page
- List/archive for notes content mounted from the external `stebennett/notes` module

### Other pages
- `layouts/_default/taxonomy.html` — single tag page
- `layouts/_default/terms.html` — all tags with counts
- `layouts/404.html` — simple error page

## Header / Navigation

- Emerald accent bar (1px/4px) across the top of every page
- White header bar (`bg-white dark:bg-zinc-900`) with bottom border
- Left: site title "Steve Bennett" (bold, links to homepage)
- Right: nav links — **Archive**, **Notes**, **About**, **RSS icon**, **dark mode toggle** (sun/moon)
- No nav item is highlighted on the homepage — "Archive" links to the full post list
- Responsive: needs mobile hamburger or simplified layout at small breakpoints

## Footer

- Simple: copyright on left, social icons (GitHub, LinkedIn, Mastodon) on right
- White background with top border, matching header

## Dark Mode

- `darkMode: 'class'` in Tailwind config
- Inline `<script>` in `<head>` (before body paint) reads `localStorage.getItem('theme')`, falls back to `window.matchMedia('(prefers-color-scheme: dark)')`, applies `dark` class to `<html>`
- Toggle button: swaps class, persists to `localStorage`
- `matchMedia` change listener updates when no manual override is set
- All templates use `dark:` Tailwind variants

## Content Model Changes

- Posts need a **`highlighted`** frontmatter field (boolean) to control which appear on the homepage
- Posts need a **category or topic** frontmatter field displayed above the title
- Existing TOML frontmatter format (`+++` delimiters) is retained

## Typography

- **Article body**: Newsreader (serif) via `font-editorial` class — gives an editorial, readable feel
- **Headings within articles**: Inter (sans-serif) via `prose-headings:font-sans` — contrast with body text
- **UI chrome** (nav, sidebar, metadata, tags): Inter (sans-serif)
- **Code**: JetBrains Mono / SF Mono / Consolas
- Article content wrapped in `prose prose-zinc dark:prose-invert prose-lg` with customisations for links (accent colour, no underline, underline on hover), blockquotes (accent border, not italic), and code blocks (zinc background, border, rounded)

## Sidebar

- **Not sticky** — scrolls with the page
- Two cards only:
  1. **Bio card**: avatar (56px, rounded, accent ring), name, "Engineering Leader" tagline, short bio text, "More about Steve →" link
  2. **Slack community card**: Slack logo, "Engineering Managers Slack" title, description, full-width green CTA button
- Hidden on mobile (`hidden lg:block`)

## Tailwind Infrastructure

Files to create at repo root:
- `package.json` — devDependencies: `@tailwindcss/postcss`, `@tailwindcss/typography`, `postcss`
- `postcss.config.js` — loads `@tailwindcss/postcss` plugin
- `assets/css/main.css` — Tailwind directives, `@theme` block with accent colours, custom styles for shortcode classes (`kg-bookmark-*`, `kg-gallery-*`), Google Fonts import
- Add `node_modules/` to `.gitignore`
- Add `[build.buildStats]` to `config.toml`
- Run `npm install`, commit `package-lock.json`

## Layout Files to Create

All under `layouts/`:

| File | Purpose |
|---|---|
| `_default/baseof.html` | HTML shell, head partial, header, main block, footer, dark mode init script |
| `partials/head.html` | Meta tags, Hugo Pipes CSS, favicon, GA, RSS, Google Fonts |
| `partials/header.html` | Accent bar, site title, nav (Archive, Notes, About, RSS, dark toggle) |
| `partials/footer.html` | Copyright, social icons |
| `partials/sidebar.html` | Bio card + Slack community card (reused on homepage and article) |
| `partials/author-bio.html` | Short author card for bottom of articles |
| `index.html` | Homepage: 5 highlighted full articles + sidebar |
| `_default/single.html` | Article: category, title, metadata, content, tags, author bio + sidebar |
| `_default/list.html` | Archive: posts grouped by year |
| `_default/taxonomy.html` | Single tag page |
| `_default/terms.html` | All tags with counts |
| `404.html` | Error page |
| `_default/_markup/render-heading.html` | Anchor links on headings |
| `_default/_markup/render-image.html` | Responsive images |
| `_default/_markup/render-link.html` | External links open in new tab |

## Existing Files Kept As-Is

- `layouts/shortcodes/bookmark.html`, `gallery.html`, `galleryImg.html`, `amazon.html`
- `content/homeBoxes/`, `content/homeTabs/` (retained but not rendered)
- `static/images/*` (avatar, favicon, company logos, slack logo)

## Module and Config Cleanup

- `config.toml`: Remove theme module import, keep notes module, add `[build.buildStats]`
- `go.mod`: Remove `require` for `stevebennett-theme`, remove commented `replace` directive
- Run `hugo mod tidy` to clean `go.sum`
- Delete `_vendor/` directory

## CI Updates

- `.github/workflows/pages.yml`: Add `actions/setup-node@v4` (Node 20) + `npm ci` before Hugo build
- `.github/workflows/notes-autopr.yml`: Same Node.js setup if it runs Hugo builds
- `Dockerfile`: Add `nodejs npm`, add `npm ci`, remove dart-sass

## Implementation Order

1. **Tailwind infrastructure** — package.json, postcss config, CSS entry point, config.toml build stats
2. **Core layouts** — baseof, head, header, footer, sidebar partials
3. **Homepage** — index.html with full highlighted articles + sidebar
4. **Article page** — single.html with category label, content, tags, author bio, sidebar
5. **Archive page** — list.html with posts grouped by year
6. **Supporting layouts** — taxonomy, terms, 404, render hooks
7. **Dark mode** — init script, toggle, matchMedia listener, dark: variants throughout
8. **Content model** — add `highlighted` and category fields to select posts
9. **Module cleanup** — remove theme dependency, delete vendor, tidy modules
10. **CI updates** — Node.js in GitHub Actions and Dockerfile
11. **Shortcode styling** — CSS for bookmark, gallery, amazon shortcodes
12. **Testing and verification**

## Verification

1. `hugo server` builds and serves without errors
2. Homepage shows 5 full highlighted articles with category labels, sidebar with bio and Slack card only
3. Article page shows category, full content, tags, author bio at bottom, sidebar
4. Archive (`/posts/`) lists all posts grouped by year
5. Notes (`/notes/`) mount and render from external module
6. Tags (`/tags/`) listing and individual tag pages work
7. About page renders full bio
8. 404 page works
9. Dark mode: OS preference detection, manual toggle, persistence, no FOUC
10. Responsive: 320px, 375px, 768px, 1024px viewports — sidebar hidden on mobile
11. Shortcodes: amazon, bookmark, gallery, x, youtube all render correctly
12. RSS feed generates at `/index.xml`
13. `hugo --minify` production build succeeds
14. GitHub Actions CI passes on feature branch
15. Google Analytics tag present in production

## Related GitHub Issues

- #88 — Set up Tailwind CSS infrastructure
- #89 — Create core layouts
- #90 — Create supporting layouts
- #91 — Implement dark mode
- #92 — Remove external theme module and clean up
- #93 — Update CI and Dockerfile for Tailwind build
- #94 — Verification and testing
- #95 — Epic: Replace external theme with new inline Tailwind CSS theme
