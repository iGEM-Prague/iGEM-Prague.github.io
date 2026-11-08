# Maven Pro – font

Maven Pro by Joe Prince, SIL Open Font License 1.1 (https://openfontlicense.org).
A variable font: one file covers all weights 400–900.

Downloaded from Google Fonts (version v40). Google serves the font split by script;
the site uses the `latin` and `latin-ext` (Czech letters) parts. To download them, ask
for the CSS with a browser-like user agent and fetch the `.woff2` URLs listed in it:

    curl -A "Mozilla/5.0 (X11; Linux x86_64; rv:130.0) Gecko/20100101 Firefox/130.0" \
      "https://fonts.googleapis.com/css2?family=Maven+Pro:wght@400..900&display=swap"

The file for each part is named by the `/* latin */`, `/* latin-ext */`, ... comment above
its `src:` URL. The `@font-face` rules using these files are at the top of `css/grayscale.scss`
(with the `unicode-range` copied from that CSS). Another Google font is added the same way.
