# BohemiaBio Website

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

## Third-party files

The site loads nothing from other servers; everything is stored in the repository:

| What | Where | License |
| ---- | ----- | ------- |
| Bootstrap 5.3.3 styles: only the parts the site uses | `_sass/bootstrap/`, compiled by `css/bootstrap.scss` | MIT |
| Bootstrap 5.3.3 JavaScript (phone menu) | `assets/bootstrap/bootstrap.min.js` | MIT |
| Font Awesome Free 7.0.1 icons (solid + brands) | `assets/fontawesome/` | CC BY 4.0 / OFL / MIT |
| Maven Pro font | `assets/fonts/` | SIL OFL |

To use another Bootstrap component (e.g. tables, cards), copy its file from the
Bootstrap 5.3.3 source (`scss/`) to `_sass/bootstrap/` and add an `@import` to `css/bootstrap.scss`.
Any [Font Awesome Free](https://fontawesome.com/search?ic=free) solid or brand icon works,
e.g. a new network in `social:` in `_config.yml`.

## Structure of the site

| Page                             | Content                                         |
| -------------------------------- | ----------------------------------------------- |
| `/` (main page)                  | About us, Timeline, Contact                     |
| `/2027/`                         | About project, News (latest 3 posts), Members   |
| `/2027/news/`                    | All news of 2027, with search and category filter |
| `/2027/members/`                 | Team members of 2027                            |
| `/2027/news/MM/DD/title/`        | A single news post (Czech version: `.../title/cs/`) |

Texts of the pages live in `_sections/` (main page) and `_sections/2027/` (2027 page).

## Two languages (English and Czech)

Every page contains both languages; the **CZ / EN** button in the navigation bar
switches between them instantly (like the dark mode button) and the choice is remembered.
English is the default. When a Czech text is missing, the English one is shown instead
(and the other way round), so a page never ends up empty.

Texts are written like this:

- **Longer texts**: two Markdown files side by side, `NAME.en.md` and `NAME.cs.md`, e.g.
  `_sections/about.en.md` and `_sections/about.cs.md`. The `title:` in their front matter
  (the part between `---` lines) is the section's name in the navigation bar; the text
  below it is shown on the page.
- **Short texts in front matter** (timeline descriptions, member roles and bios, header
  phrases): either one text for both languages, or an `en` / `cs` pair:

  ```yaml
  description:
    en: "Genetically engineering cyanobacteria to enhance space travel."
    cs: "Genetické inženýrství sinic pro podporu vesmírných cest."
  ```
- **Things that are not text** (order of sections, timeline entries, member list) are in
  one file without a language suffix: `index.md`, `timeline.md`, `members.md`.
- **Texts of buttons and labels** ("All news", "Meet the team", ...) are in `_data/i18n.yml`.

## Editing the main page

| What                       | Where                                                         |
| -------------------------- | ------------------------------------------------------------- |
| About us                   | `_sections/about.en.md`, `_sections/about.cs.md`              |
| Timeline heading           | `_sections/timeline.en.md`, `_sections/timeline.cs.md`        |
| Timeline entries           | `events:` in `_sections/timeline.md`                          |
| "Recent project" nav link  | first timeline entry (automatically)                          |
| Contact text               | `_sections/contact.en.md`, `_sections/contact.cs.md`          |
| Contact email              | `email:` in `_config.yml`                                     |
| Instagram / GitHub icons   | `social:` in `_config.yml`                                    |
| Text typed in the header   | `header-text:` in `_sections/index.md` (`en` / `cs` lists, one phrase is picked at random) |
| Order of sections          | `sections:` in `_sections/index.md`                           |
| Header background, logo    | `background-img:`, `me-img:` in `_config.yml` (files in `img/`) |

### Timeline entries

`events:` in `_sections/timeline.md` lists one entry per year, newest first:

```yaml
- date: "2027"
  title: "CrocoVoyage"
  description:
    en: "One or two sentences about the project."
    cs: "Jedna nebo dvě věty o projektu."
  image: "/img/team-logo.webp"
  link: "/2027/"                                # page of this site...
- date: "2025"
  title: "..."
  description: { en: "...", cs: "..." }
  image: "/img/team-logo.webp"
  link: "https://2025.igem.wiki/bohemiabio/"    # ...or an external URL
```

External links open in a new tab.

## Editing the 2027 page

| What                            | Where                                                      |
| ------------------------------- | ---------------------------------------------------------- |
| About project                   | `_sections/2027/about.en.md`, `about.cs.md`                |
| News intro text                 | `_sections/2027/news.en.md`, `news.cs.md`                  |
| Members intro text              | `_sections/2027/members.en.md`, `members.cs.md`            |
| Team members                    | `members:` in `_sections/2027/members.md`                  |
| Text typed in the header        | `header-text:` in `_sections/2027/index.md` (one phrase, a list, or `en` / `cs` lists) |
| Order of sections               | `sections:` in `_sections/2027/index.md`                   |
| Sponsor logos in the footer     | `sponsors:` in `_sections/2027/index.md`, logos in `img/2027/sponsors/` |

The intro texts of News and Members are shown both on the 2027 page and
above the list of all news / members.

In the navigation bar, News and Members open their separate pages (`/2027/news/`,
`/2027/members/`) because of `nav-link:` in `news.en.md` / `members.en.md`. Any section
can get one: a relative path is taken from the year's page (`news/` → `/2027/news/`),
a full URL opens that site. Without `nav-link:` the navbar scrolls to the section.

### Sponsors

The footer of all 2027 pages shows the logos listed in `sponsors:` in `_sections/2027/index.md`,
in that order (one row on computers, one column on phones). `name` (shown when hovering and to
screen readers), `url` and `logo` can each be one value or an `en` / `cs` pair:

```yaml
sponsors:
  - name: "IOCB Prague"
    url: { en: "https://www.uochb.cz/en", cs: "https://www.uochb.cz/cs" }
    logo: "/img/2027/sponsors/iocb.webp"
```

Logos go to `img/2027/sponsors/`: transparent background, WebP, about 160 px high. Convert with
ImageMagick, trimming the empty border so all logos look equally big:

    magick logo.png -trim +repage -resize x160 -define webp:lossless=true img/2027/sponsors/name.webp

### Adding a team member

Add an entry to `members:` in `_sections/2027/members.md`:

```yaml
members:
  - name: "Jana Nováková"
    role: { en: "Wet lab", cs: "Laboratoř" }
    photo: "/img/2027/members/jana_novakova.webp"
    bio:
      en: "A few sentences about Jana."
      cs: "Pár vět o Janě."
```

Put the photo to `img/2027/members/`, named after the person in lowercase, with spaces
replaced by `_` and without diacritics (`jana_novakova.webp`). It is shown as a circle, so use
a square photo with the face in the middle, about 400×400 px. Until the photo file exists
(or without a `photo`), the team logo is shown instead.

## Adding news posts

A post is written in one language; English posts go to `_posts/2027/en/`, Czech ones
to `_posts/2027/cs/`.

1. Create a file named `YYYY-MM-DD-title.md`, e.g.
   `_posts/2027/en/2027-11-05-first-transformation.md`. The date in the name is the
   publishing date; the rest becomes the URL (use lowercase letters, numbers and `-`).
2. Start it with front matter, then write the post in Markdown:

   ```markdown
   ---
   title: "First successful transformation"
   date: 2027-11-05 10:00:00 +0100
   categories: [labwork]
   ---

   Text of the post...

   ![Colonies on a plate](/img/2027/news/colonies.webp)
   ```

3. Put images to `img/2027/news/` and link them as shown above.

The folder (`_posts/2027/`) decides which year page a post appears on, not its date, so a
post written in 2026 about the 2027 project belongs to `_posts/2027/`.
The newest 3 posts are shown on the 2027 page, all of them on `/2027/news/`.

### Translating a post

To publish a post in both languages, give the translation **the same file name** in the
other folder, e.g. `_posts/2027/en/2027-11-05-first-transformation.md` and
`_posts/2027/cs/2027-11-05-first-transformation.md`. They are linked automatically:

- the news lists show each reader only the version in their language,
- the CZ / EN button on the post opens the other version, and a link at the top of
  the post leads there too,
- opening a post in the other language than the chosen one shows the chosen version.

A post without a translation is listed in both languages, marked "(in Czech)" or "(anglicky)".

### Categories

Write any categories in `categories: [labwork, outreach]` (or a single
`category: labwork`). Nothing else needs to be created: the filter buttons on
the News page are generated from the categories used in that year's posts.
Use the same spelling each time (also in both language versions), otherwise you get two buttons.

### Search

The search box on the News page matches words in post titles, texts and
categories, ignoring case and diacritics (`vesmir` finds `vesmír`).
Filtered views can be shared, e.g. `/2027/news/?category=labwork&q=plasmid`.

## Adding a new year (e.g. 2028)

1. Copy `_sections/2027/` to `_sections/2028/` and rewrite the texts; empty the
   `members:` list and change `header-text:` and `sponsors:`.
2. Copy the folder `2027/` (page files) to `2028/` and in each of its three files
   replace `2027` by `2028` (`sections-dir`, `year`, `title`, `permalink`).
3. In `_config.yml`, under `defaults:`, copy the two `_posts/2027` entries and replace
   `2027` by `2028` in them (they make posts in `_posts/2028/` belong to 2028).
4. Put the year's posts to `_posts/2028/en/` and `_posts/2028/cs/`, images to `img/2028/`.
5. Add the year to the top of `events:` in `_sections/timeline.md` with `link: "/2028/"`.

Old years keep working unchanged.
