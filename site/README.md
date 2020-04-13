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
