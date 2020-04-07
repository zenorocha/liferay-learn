# Enabling Search Suggestions

Suggest search terms to users when their initial queries are suboptimal. Spell check settings allow administrators to configure the Search application so that if a user types a search term that doesn't return many results (for example, a slightly misspelled werd), the user can be prompted to improve the search. 

To configure the spell check settings:

1.  You must first reindex the spell check indexes. Go to *Control Panel* &rarr; *Configuration* &rarr; *Search*, and open the Index Actions screen.

    Click *Execute* next to *Reindex all spell check indexes*.

1. Add the Suggestions widget to the search page.

1. Open its configuration screen. Click the widget Options button (![Options](../../images/icon-widget-options.png)) and select *Configuration*.

![Configure the suggestion settings to allow for user input mistakes and help lead users to results.](./searching-for-content/images/07.png)

There are three main settings here:

**Display "Did you mean..." if the number of search results does not meet the threshold:** Present users alternate, spell checked search queries if their search did not return a minimum number of results (50 by default).

**Display Related Queries:** If the number of search results doesn't meet the specified threshold (50 by default), display up to a maximum number of alternative queries (10 by default).

**Add New Related Queries Based on Successful Queries:** Index a user's search query if it produces a minimum number of results (50 by default), so it can be displayed to users as a suggestion. If the Display Related Queries setting is enabled, it's used as a related query for similar search queries that don't produce enough results.