# Search Results

With a Search Bar on every page in the default Liferay DXP experience, it won't be long before a User is looking at a list of Search Results:

<!-- Table with common search result interventions, where to find and where the docs are ?-->

![The goal of search: return the perfect results to Users searching for content in your site.](./search-results/images/01.png)

The developers of a content type (an _asset_ in Liferay DXP) control much about how the asset's information is stored in the search engine (this process is called *indexing*), and how its information is searched and returned in the search results. Developers who dislike how a particular asset behaves in search can use an *Indexer Post Processor* to modify the asset's indexing behavior and how search queries are constructed to look up the assets in @product@.

The Search Results behavior configurable through the UI is covered in this section:

- [Configuring the Search Results Widget](./configuring-the-search-results-widget.md)

- [Filtering Results](./filtering-results.md) 

- [Sorting Results](./sorting-results.md) 

- [Search Results Behavior](./understanding-search-results.md)

Keep in mind though, almost everything you do when [configuring search](../../search_administration_and_tuning.rst) has an impact on search results. In addition to the Search Results widget and the supporting widgets that impact Search Results directly, there's a Control Panel menu called Search Tuning with two entries that directly impace Search Results:

1. [Synonym Sets](./../../search-administration-and-tuning/synonym-sets.md)
2. [Result Rankings](../../search-administration-and-tuning/result-rankings.md)

