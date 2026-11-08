# Bootstrap 5.3.3 – Sass source (subset)

Downloaded from the official npm package (MIT license, see `LICENSE`):

    curl -L -o bootstrap.tgz https://registry.npmjs.org/bootstrap/-/bootstrap-5.3.3.tgz
    tar -xzf bootstrap.tgz          # unpacks to package/

The files here are copied unchanged from `package/scss/`. Only the parts the site uses
are included; they are compiled by `css/bootstrap.scss` (Jekyll's Sass, no extra tools):

- configuration: `_functions`, `_variables`, `_variables-dark`, `_maps`, `_mixins` (+ `mixins/`),
  `_utilities`, `vendor/_rfs`
- layout & components: `_root`, `_reboot`, `_type`, `_images`, `_containers`, `_grid`,
  `forms/_labels`, `forms/_form-text`, `forms/_form-control`, `_buttons`, `_transitions`,
  `_nav`, `_navbar`
- helpers & utility classes: `_helpers` (+ `helpers/`), `utilities/_api`

## Adding another component

1. Download and unpack the package as above (keep the same version, 5.3.3).
2. Copy the component's file, e.g. `package/scss/_tables.scss` or `_card.scss`, here.
   Some components import further files (look for `@import` in them) – copy those too.
3. Add `@import "bootstrap/tables";` to `css/bootstrap.scss`, at the position it has in
   `package/scss/bootstrap.scss` (the order matters).
4. Build the site and check that the classes work (https://getbootstrap.com/docs/5.3/).
