import os
from sphinx.builders.html import StandaloneHTMLBuilder

import recommonmark
from recommonmark.transform import AutoStructify

#
# https://www.sphinx-doc.org/en/master/usage/configuration.html
#

author = "Liferay"
copybutton_image_path="img/paste.svg"
copyright = "2019, Liferay"
extensions = ["notfound.extension", "recommonmark", "sphinx_copybutton", "sphinx_markdown_tables"]
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

# Set the language by using the last 2 characters of the project directory

parent_dir_path, parent_dir_name = os.path.split(os.path.dirname(__file__))

language = parent_dir_name

locale_dirs = ["_locale"]
master_doc = "contents"
notfound_no_urls_prefix = True
notfound_template = "404.html"
project = "Liferay Learn"
release = "1.0"
source_suffix = [".md", ".rst"]
templates_path = ["_templates"]
version = "1.0"

class WithRootSiteHTMLBuilder(StandaloneHTMLBuilder):
	def get_doc_context(self, docname, body, metatags):
		doc_context = super().get_doc_context(docname, body, metatags)

		if docname != 'README':
			# Set the README.md on the root level as the "fake" parent
			# ie: docs/commerce/README.md
			site_parent = self.get_relative_uri(docname, 'README')

			# Set the document title as site title
			# ie: Commerce or DXP Cloud, etc
			site_title = self.render_partial(self.env.titles['README'])['title']

			# Add the "fake" parent to the parents object, so that "DXP", "Commerce", etc.
			# is visible in the breadcrumbs
			doc_context['parents'].insert(
				0,
				{
					'link': site_parent,
					'title': site_title
				}
			)

		return doc_context

def setup(app):
	app.add_builder(WithRootSiteHTMLBuilder, True)

	app.add_config_value('recommonmark_config', {
		'enable_auto_toc_tree': False,
		'enable_math': False,
		'enable_inline_math': False
	}, True)

	app.add_transform(AutoStructify)