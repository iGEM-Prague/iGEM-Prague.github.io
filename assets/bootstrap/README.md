# Bootstrap 5.3.3 – JavaScript

`bootstrap.min.js` is copied unchanged from the official npm package (MIT license, see `LICENSE`):

    curl -L -o bootstrap.tgz https://registry.npmjs.org/bootstrap/-/bootstrap-5.3.3.tgz
    tar -xzf bootstrap.tgz
    cp package/dist/js/bootstrap.min.js .

It contains all Bootstrap plugins; the site uses the Collapse plugin (phone menu).
It is the build **without Popper**. If dropdowns, tooltips or popovers are ever needed, use
`package/dist/js/bootstrap.bundle.min.js` (includes Popper) instead and change the file name
in `_includes/js.html`. Their styles also need to be added, see `_sass/bootstrap/README.md`.
