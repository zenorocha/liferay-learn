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

## Building the Site

> **OS-specific pitfalls:** 
> - _Windows:_ If you see an error like
>    `[./build_site.sh: line 220: /c/Users/liferay/AppData/Local/Microsoft/WindowsApps/python3: Permission denied` you probably have conflicting Python versions installed. To correct it, use the second part of this [StackOverflow post](https://stackoverflow.com/a/57168165/4325798) to fix it: "type `manage app execution aliases` into the Windows search prompt and disable [all] the store versions of Python altogether."
> - _MacOS:_ This script requires `gnu-find` and `gnu-sed`. Make sure you have these installed (e.g., `brew install gnu-find/sed`)

Sphinx projects are typically built with a `Makefile`. This project is built with a shell script instead. Once executed it generates a `build/output` directory inside `site`. The final static html pages are there.

The Build script can take 0, 1, or 2 arguments. Usage and behavior is as follows:

General usage:

```bash
./build_site.sh [arg1:product] [arg2:version]
```

> Run it without arguments to build all of the docs site (all products) but not do the stuff for production (e.g., `git clean -dfx`). This is equivalent to passing the "all" argument.

------------

### Examples and Behaviors

#### Build for Production

> **Warning:** Your docs folder is automatically subject to a
>
> `git clean -dfx`
>
> If you use this option. Only run this if you're building the site for publication.

```bash
./build_site.sh prod
```

**Behavior:** This provides the exact same behavior as before we began accepting arguments. We still need to figure out the cleanest way to call upload_to_server for only this usage. Includes a `git clean -dfx` on the docs folder.

------------

#### Build a Single Product's Default Version

The default versions are hard-coded in the script (`2.x`, `7.x`, `latest`).

```bash
./build_site.sh dxp-cloud [other valid values are `dxp` and `commerce`]
```

**Behavior:** Without git cleaning, build the specified product with the default version. Until we add more versions, there's no need to use the next example.

------------

#### Build a Single Product With a Specific Version

```bash
./build_site.sh dxp-cloud latest [other valid arg statements are `dxp 7.x` and `commerce 2.x`]
```

**Behavior:** Without git cleaning, build a single product with a specified version.

------------

#### Build All Products and Versions for Local Testing

```bash
./build_site.sh all
```

**Behavior:** Same behavior as [prod](#build-for-production) but `git clean -dfx` is not included. We'll also avoid calling `upload_to_server` as well.
