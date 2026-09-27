# iGEM Prague Website

Built with [personal-jekyll-theme](https://github.com/le4ker/personal-jekyll-theme).

Everything is static and typed in [Markdown](https://www.markdownguide.org/cheat-sheet/).

## Local preview (using Docker)

First time (or after modifying the Dockerfile / Gemfile):

```bash
docker-compose up --build
```

Then just run:

```bash
docker-compose up
```

Visit `http://localhost:4000`.

## Deployment

Push to `main` for deploy using GitHub Actions.
The page will be live on `https://igem-prague.github.io/`.

## Adding blog posts

Add a new file to `_posts/` named `YYYY-MM-DD-title.md`.
Copy header from files already present.

If you use a new `category:`, add a matching file under `categories/<name>.html`
(copy an existing one and change `title:`).
