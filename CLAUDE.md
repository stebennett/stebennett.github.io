# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Personal website and blog for Steve Bennett, built with Hugo (v0.159.1 extended). Deployed to GitHub Pages at stevebennett.co via automated GitHub Actions on push to `main`.

## Build & Development Commands

```bash
# Local dev server (install Hugo via Homebrew: brew install hugo)
hugo server --bind 0.0.0.0

# Production build (as used in CI)
hugo --logLevel info --minify --baseURL "https://stevebennett.co/"

# Module management
hugo mod get -u       # Update Hugo modules
hugo mod tidy         # Clean up module dependencies
hugo mod graph        # Show module dependency graph

# Docker alternative
docker build -t stevebennett-site . && docker run -p 1313:1313 stevebennett-site
```

## Architecture

**Hugo Modules (not traditional themes directory):** The site uses two external Hugo modules defined in `go.mod`:
- `github.com/stebennett/stevebennett-theme` — custom theme (templates, styles, layouts)
- `github.com/stebennett/notes` — external notes content, auto-synced via `.github/workflows/notes-autopr.yml`

For local theme development, uncomment the replace directive in `go.mod` to point at a local checkout.

**Content types:**
- `content/posts/` — blog posts using TOML frontmatter (`+++` delimiters) with `author`, `date`, `slug`, `title` fields. Permalink: `/posts/{slug}/`
- `content/homeBoxes/` and `content/homeTabs/` — homepage sections (community links, work history)
- Notes are mounted from the external module. Permalink: `/notes/{year}/{month}/{day}/{slug}/`

**Custom shortcodes** in `layouts/shortcodes/`: `bookmark`, `gallery`, `galleryImg`, `amazon`.

## Deployment

Pushing to `main` triggers the GitHub Pages workflow (`.github/workflows/pages.yml`). The workflow requires a `GH_AUTH_TOKEN` secret for fetching private Hugo modules.
