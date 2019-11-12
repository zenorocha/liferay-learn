import os
from sphinx.builders.html import StandaloneHTMLBuilder

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

	def _get_parents(self, titles, docname):
		parents = []

		while docname != '/README':
			basename = os.path.basename(docname)

			if basename == 'README':
				readme = os.path.dirname(os.path.dirname(docname)) + '/README'
			else:
				readme = os.path.dirname(docname) + '/README'

			if readme in titles:
				parents.append(
					{
						'link': self.get_relative_uri(docname, readme),
						'title': self.render_partial(titles[readme])['title']
					}
				)

			docname = readme

		parents.reverse() 
		return parents

def setup(app):
	app.add_builder(RelativePathParentsHTMLBuilder, True)