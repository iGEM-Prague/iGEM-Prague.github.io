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
| `/2026/news/MM/DD/title/`        | A single news post (Czech version: `.../title/cs/`) |

Texts of the pages live in `_sections/` (main page) and `_sections/2026/` (2026 page).

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
- date: "2026"
  title: "CrocoVoyage"
  description:
    en: "One or two sentences about the project."
    cs: "Jedna nebo dvě věty o projektu."
  image: "/img/team-logo.webp"
  link: "/2026/"                                # page of this site...
- date: "2025"
  title: "..."
  description: { en: "...", cs: "..." }
  image: "/img/team-logo.webp"
  link: "https://2025.igem.wiki/bohemiabio/"    # ...or an external URL
```

External links open in a new tab.

## Editing the 2026 page

| What                            | Where                                                      |
| ------------------------------- | ---------------------------------------------------------- |
| About project                   | `_sections/2026/about.en.md`, `about.cs.md`                |
| News intro text                 | `_sections/2026/news.en.md`, `news.cs.md`                  |
| Members intro text              | `_sections/2026/members.en.md`, `members.cs.md`            |
| Team members                    | `members:` in `_sections/2026/members.md`                  |
| Text typed in the header        | `header-text:` in `_sections/2026/index.md` (one phrase, a list, or `en` / `cs` lists) |
| Order of sections               | `sections:` in `_sections/2026/index.md`                   |

The intro texts of News and Members are shown both on the 2026 page and
above the list of all news / members.

### Adding a team member

Add an entry to `members:` in `_sections/2026/members.md`:

```yaml
members:
  - name: "Jana Nováková"
    role: { en: "Wet lab", cs: "Laboratoř" }
    photo: "/img/2026/members/jana.webp"
    bio:
      en: "A few sentences about Jana."
      cs: "Pár vět o Janě."
```

Put the photo to `img/2026/members/`. It is shown as a circle, so use a square
photo with the face in the middle, about 400×400 px (`.webp` or `.jpg`).
Without a `photo`, the team logo is shown instead.

## Adding news posts

A post is written in one language; English posts go to `_posts/2026/en/`, Czech ones
to `_posts/2026/cs/`.

1. Create a file named `YYYY-MM-DD-title.md`, e.g.
   `_posts/2026/en/2026-11-05-first-transformation.md`. The date in the name is the
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

### Translating a post

To publish a post in both languages, give the translation **the same file name** in the
other folder, e.g. `_posts/2026/en/2026-11-05-first-transformation.md` and
`_posts/2026/cs/2026-11-05-first-transformation.md`. They are linked automatically:

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
Filtered views can be shared, e.g. `/2026/news/?category=labwork&q=plasmid`.

## Adding a new year (e.g. 2027)

1. Copy `_sections/2026/` to `_sections/2027/` and rewrite the texts; empty the
   `members:` list and change `header-text:`.
2. Copy the folder `2026/` (page files) to `2027/` and in each of its three files
   replace `2026` by `2027` (`sections-dir`, `year`, `title`, `permalink`).
3. Put the year's posts to `_posts/2027/en/` and `_posts/2027/cs/`, images to `img/2027/`.
4. Add the year to the top of `events:` in `_sections/timeline.md` with `link: "/2027/"`.

Old years keep working unchanged.
