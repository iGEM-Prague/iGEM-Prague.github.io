# iGEM Prague Website

Built with [personal-jekyll-theme](https://github.com/le4ker/personal-jekyll-theme).

Everything is static and typed in [Markdown](https://www.markdownguide.org/cheat-sheet/).

TODOs are in the file [TODO.md](./TODO.md).

## Local preview (using Docker)

First time (or after modifying the Dockerfile / Gemfile):

```bash
docker-compose up --build
```

Then just run:

```bash
docker-compose up
```

Visit `http://localhost:4000`. Changes to files show up after a page reload,
except changes to `_config.yml`, which need a restart (`docker-compose restart`).

## Deployment

Push to `main` for deploy using GitHub Actions.
The page will be live on `https://igem-prague.github.io/`.

## Structure of the site

| Page                             | Content                                         |
| -------------------------------- | ----------------------------------------------- |
| `/` (main page)                  | About us, Timeline, Contact                     |
| `/2026/`                         | About project, News (latest 3 posts), Members   |
| `/2026/news/`                    | All news of 2026, with search and category filter |
| `/2026/members/`                 | Team members of 2026                            |
| `/2026/news/MM/DD/title/`        | A single news post                              |

Texts of the pages live in `_sections/` (main page) and `_sections/2026/` (2026 page).
Each file there is one section of the page; the heading and text below the
front matter (the part between `---` lines) is what gets shown.

## Editing the main page

| What                       | Where                                                         |
| -------------------------- | ------------------------------------------------------------- |
| About us                   | `_sections/about.md`                                          |
| Timeline heading           | `_sections/timeline.md`                                       |
| Timeline entries           | `_data/timeline.yml`                                          |
| "Recent project" nav link  | first entry of `_data/timeline.yml` (automatically)           |
| Contact text               | `_sections/contact.md`                                        |
| Contact email              | `email:` in `_config.yml`                                     |
| Instagram / GitHub icons   | `social:` in `_config.yml`                                    |
| Text typed in the header   | `header-text:` in `_sections/index.md`                        |
| Order of sections          | `sections:` in `_sections/index.md`                           |
| Header background, logo    | `background-img:`, `me-img:` in `_config.yml` (files in `img/`) |

The `title:` in the front matter of each section is its name in the navigation bar.

### Timeline entries

`_data/timeline.yml` lists one entry per year, newest first:

```yaml
- date: "2026"
  title: "CrocoVoyage"
  description: "One or two sentences about the project."
  image: "/img/team-logo.webp"
  link: "/2026/"                                # page of this site...
- date: "2025"
  title: "..."
  description: "..."
  image: "/img/team-logo.webp"
  link: "https://2025.igem.wiki/bohemiabio/"    # ...or an external URL
```

External links open in a new tab.

## Editing the 2026 page

| What                            | Where                                     |
| ------------------------------- | ----------------------------------------- |
| About project                   | `_sections/2026/about.md`                 |
| News intro text                 | `_sections/2026/news.md`                  |
| Members intro text              | `_sections/2026/members.md`               |
| Team members                    | `members:` in `_sections/2026/members.md` |
| Text typed in the header        | `header-text:` in `_sections/2026/index.md` |
| Order of sections               | `sections:` in `_sections/2026/index.md`  |

The intro texts of News and Members are shown both on the 2026 page and
above the list of all news / members.

### Adding a team member

Add an entry to `members:` in `_sections/2026/members.md`:

```yaml
members:
  - name: "Jana Nováková"
    role: "Wet lab"
    photo: "/img/2026/members/jana.webp"
    bio: "A few sentences about Jana."
```

Put the photo to `img/2026/members/`. It is shown as a circle, so use a square
photo with the face in the middle, about 400×400 px (`.webp` or `.jpg`).
Without a `photo`, the team logo is shown instead.

## Adding news posts

1. Create a file in `_posts/2026/` named `YYYY-MM-DD-title.md`, e.g.
   `_posts/2026/2026-11-05-first-transformation.md`. The date in the name is the
   publishing date; the rest becomes the URL (use lowercase letters, numbers and `-`).
2. Start it with front matter, then write the post in Markdown:

   ```markdown
   ---
   title: "First successful transformation"
   date: 2026-11-05 10:00:00 +0100
   categories: [labwork]
   ---

   Text of the post...

   ![Colonies on a plate](/img/2026/news/colonies.webp)
   ```

3. Put images to `img/2026/news/` and link them as shown above.

The post's year (from its `date`) decides which year page it appears on.
The newest 3 posts are shown on the 2026 page, all of them on `/2026/news/`.

### Categories

Write any categories in `categories: [labwork, outreach]` (or a single
`category: labwork`). Nothing else needs to be created: the filter buttons on
the News page are generated from the categories used in that year's posts.
Use the same spelling each time, otherwise you get two buttons.

### Search

The search box on the News page matches words in post titles, texts and
categories, ignoring case and diacritics (`vesmir` finds `vesmír`).
Filtered views can be shared, e.g. `/2026/news/?category=labwork&q=plasmid`.

## Adding a new year (e.g. 2027)

1. Copy `_sections/2026/` to `_sections/2027/` and rewrite the texts; empty the
   `members:` list and change `header-text:`.
2. Copy the folder `2026/` (page files) to `2027/` and in each of its three files
   replace `2026` by `2027` (`sections-dir`, `year`, `title`, `permalink`).
3. Put the year's posts to `_posts/2027/` and images to `img/2027/`.
4. Add the year to the top of `_data/timeline.yml` with `link: "/2027/"`.

Old years keep working unchanged.
