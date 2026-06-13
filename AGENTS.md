# AGENTS.md

## Project

This repository contains the Jekyll source for <https://elcaminodeunaprendiz.com>.

Core stack:

- Ruby `3.4.9`
- Jekyll `4.4.x`
- Minima theme
- `jekyll-feed`
- `jekyll-seo-tag`

The generated site is written to `_site/` and is not meant to be edited directly.

## Local Build

Preferred build path uses Docker so Ruby and gems do not need to be installed on the host:

```bash
docker run --rm --user "$(id -u):$(id -g)" -e HOME=/tmp -e BUNDLE_PATH=/tmp/bundle -v "$PWD":/site -w /site ruby:3.4.9 bash -lc 'bundle install && JEKYLL_ENV=production bundle exec jekyll build'
```

If the current shell has not picked up Docker group membership yet, wrap Docker commands with `sg docker -c '...'` or log out and back in.

Host Ruby alternative:

```bash
bundle install
JEKYLL_ENV=production bundle exec jekyll build
```

## Local Check

Serve the generated site with Docker:

```bash
docker run --rm -d --name blog-site-check -p 127.0.0.1:4080:80 -v "$PWD/_site":/usr/share/nginx/html:ro nginx:alpine
```

Then check:

- Home page: <http://127.0.0.1:4080/>
- A representative post page, for example: <http://127.0.0.1:4080/posts/patterns-principles-and-practices-ddd-highlights/>
- Removed CMS route: <http://127.0.0.1:4080/admin/> should return `404`.
- Browser console should have no runtime errors.
- Main assets should return `200` or `304`.
- Mobile viewport should not have horizontal overflow.

Stop the check server when done:

```bash
docker rm -f blog-site-check
```

## Netlify

Netlify builds from `netlify.toml`:

```bash
bundle exec jekyll build
```

The publish directory is `_site` and `JEKYLL_ENV` is `production`.

## Editing Notes

- Keep content changes in Markdown files under `_posts/`, `_drafts/`, `_articles/`, or root pages.
- Keep layout/template changes in `_layouts/` and `_includes/`.
- Keep custom styles in `assets/custom.css` unless changing the theme import itself.
- Do not reintroduce Decap CMS, Netlify Identity, or `/admin` unless explicitly requested.
- Do not edit generated files under `_site/`.
