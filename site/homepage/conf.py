#
# https://www.sphinx-doc.org/en/master/usage/configuration.html
#

author = "Liferay"
copybutton_image_path="img/paste.svg"
copyright = "2019, Liferay"
exclude_patterns = ['node_modules']
extensions = ["notfound.extension", "recommonmark", "sphinx_copybutton", "sphinx_markdown_tables"]
html_additional_pages = {"index": "index.html"}
html_css_files = ["main.css"]
html_favicon = "_static/img/favicon.ico"
#html_js_files = ["main.js"]
html_logo = "_static/img/liferay-waffle.svg"
html_short_title = "Documentation"
html_show_copyright = False
html_show_sphinx = False
html_static_path = ["_static"]
html_theme = "basic"
html_title = "Liferay Learn"
language = "en"
locale_dirs = ["_locale"]
master_doc = "contents"
notfound_no_urls_prefix = True
notfound_template = "404.html"
project = "Liferay Learn"
release = "1.0"
source_suffix = [".md", ".rst"]
templates_path = ["_templates"]
version = "1.0"