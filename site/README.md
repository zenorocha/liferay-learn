# Generating the Site

The Liferay Learn documentation site is built using [Sphinx](http://www.sphinx-doc.org/en/master/). The templates and styles are in the `/sphinx/homepage/` directory and propagated to the `/sphinx/docs/` directory via the [build script](#build-resources). The final project is compiled into static html pages by the `build_site.sh` script.

## Getting Started

1. [Install node](https://nodejs.org/en/).
2. Install all dependencies with `npm install` in the `sphinx/homepage/` directory.
3. If you would like to take advantage of live update, install autobuild with `pip install sphinx-autobuild`.

## Build Resources

To build `main.css` and propagate assets, run `npm run build` in the `/sphinx/homepage/` directory.

To leverage live update for theme changes, run `sphinx-autobuild ${path/to/sphinx/homepage/directory} build/output/homepage`. The output will be served on `http://127.0.0.1:8000/`.

## Project Structure

At the root of the project, there is a `docs` directory and a `site` directory.

### Site

Most of the site generation related logic and assets (e.g. templates, css) are stored under the `site` directory following Sphinx convention.

### Docs

The `docs` directory contains all of the written documentation related to a product in markdown. All the images referenced throughout the documentation are also stored there, under its respective section name.

At the root of each product directory, there is a set of `rst` files that serve as a table of contents for navigating the site. These `rst` files are compiled to be the site's side navigation with the rendering logic stored in `site/docs/templates/page.html`.

The product and section landing pages are achieved via [Vue](https://vuejs.org/) templates. The template logic is defined in `landingpage_template.html` and the data supplied are in respective `landing.html` files. Both the template and the data are required on the specific `rst` file that renders the landing page.

### Building Site

Sphinx projects are typicaly built with a `Makefile`. This project is built with a shell script instead. Once executed it will generate a `build/output` directory inside `site`. The final static html pages will be in there.

The Build script can take 0, 1, or 2 arguments. Usage and behavior is as follows:

General usage:

```bash
./build_site.sh [arg1:product] [arg2:version]
```
> Run it without arguments to build all of the docs site (all products) but not do the stuff for production (e.g., `git clen -dfx`). This is equivalent to passing the "all" argument.
------------
Examples and Behavior

Example 1:  Build for production

> **Warning:** Your docs folder is automatically subject to a 
> 
> `git clean -dfx`
> 
> If you use this option. Only run this if you're really building the site for publication.

```bash
./build_site.sh prod
```

Behavior: This provides the exact same behavior as before we began accepting arguments. We still need to figure out the cleanest way to call upload_to_server for only this usage. Includes a `git clean -dfx` on the docs folder.

------------
Example 2:  Build a single product's default version. The default versions are hard-coded in the script (`2.x`, `7.x`, `latest`).

```bash
./build_site.sh dxp-cloud [other valid values are `dxp` and `commerce`]
```

Behavior: Without git cleaning, build the specified product with the default version. Until we add more versions, there's no need to use the next example.

------------
Example 3:  Build a single product with a specific version

```bash
./build_site.sh dxp-cloud latest [other valid arg statements are `dxp 7.x` and `commerce 2.x`]
```
Without git cleaning, build a single product with a specified version.

------------
Example 4:  Build all products and versions, but only for testing locally

```bash
./build_site.sh all
```

Behavior: Same behavior as prod but `git clean -dfx` is not included. We'll also avoid calling upload_to_server as well.
