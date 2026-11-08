# Font Awesome Free 7.0.1 – icons

Copied unchanged from the official npm package (licenses in `LICENSE.txt`:
icons CC BY 4.0, fonts SIL OFL 1.1, code MIT):

    curl -L -o fa.tgz https://registry.npmjs.org/@fortawesome/fontawesome-free/-/fontawesome-free-7.0.1.tgz
    tar -xzf fa.tgz                 # unpacks to package/

| File here | From the package |
| --------- | ---------------- |
| `css/fontawesome.min.css` (base, icon names) | `package/css/fontawesome.min.css` |
| `css/solid.min.css`, `webfonts/fa-solid-900.woff2` (solid icons, `fa` / `fas`) | `package/css/`, `package/webfonts/` |
| `css/brands.min.css`, `webfonts/fa-brands-400.woff2` (brand logos, `fab`) | `package/css/`, `package/webfonts/` |

They are linked in `_includes/head.html`. The CSS finds its fonts at `../webfonts/`,
so keep the `css/` and `webfonts/` folders side by side.

Any free solid or brand icon already works: find it at https://fontawesome.com/search?ic=free
and use e.g. `<i class="fa-solid fa-flask"></i>` or `<i class="fab fa-linkedin"></i>`
(or `icon: "linkedin"` in `social:` in `_config.yml`).

## Adding the regular (outlined) icon style

Copy `package/css/regular.min.css` to `css/` and `package/webfonts/fa-regular-400.woff2`
to `webfonts/`, then add a `<link>` for `regular.min.css` in `_includes/head.html`.
