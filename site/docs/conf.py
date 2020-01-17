import os
from sphinx.builders.html import StandaloneHTMLBuilder

import recommonmark
from recommonmark.transform import AutoStructify

#
# https://www.sphinx-doc.org/en/master/usage/configuration.html
#

author = "Liferay"
copyright = "2019, Liferay"
extensions = ["notfound.extension", "recommonmark", "sphinx_markdown_tables"]
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
notfound_template = "404.html"
project = "Liferay Learn"
release = "1.0"
source_suffix = [".md", ".rst"]
templates_path = ["_templates"]
version = "1.0"

class RelativePathParentsHTMLBuilder(StandaloneHTMLBuilder):
	def get_doc_context(self, docname, body, metatags):
		doc_context = super().get_doc_context(docname, body, metatags)

		doc_context['parents'] = self._get_parents(self.env.titles, docname)

		return doc_context

	def _get_parent(self, docname):
		if docname == 'README':
			return None

		basename = os.path.basename(docname)

		if basename == 'README':
			dirname = os.path.dirname(os.path.dirname(docname))

			if dirname == '/':
				return basename
			else:
				return os.path.dirname(os.path.dirname(docname)) + '/README'
		else:
			return os.path.dirname(docname) + '/README'

	def _get_parents(self, titles, docname):
		parents = []

		last_parent = docname

		while last_parent is not None:
			next_parent = self._get_parent(last_parent)

			if next_parent is not None and next_parent in titles:
				parents.append(
					{
						'link': self.get_relative_uri(docname, next_parent),
						'title': self.render_partial(titles[next_parent])['title']
					}
				)

			last_parent = next_parent

		parents.reverse()

		return parents

def setup(app):
	app.add_builder(RelativePathParentsHTMLBuilder, True)

	app.add_config_value('recommonmark_config', {
		'enable_auto_toc_tree': False,
		'enable_math': False,
		'enable_inline_math': False
	}, True)

	app.add_transform(AutoStructify)