# Configuring Page Sets

Options configured for the Page Set apply to all its pages and override options set at the Site level. However, [customizations to an individual page](./06-configuring-individual-pages.md) override those for the Page Set. To configure a Page Set, follow these steps:

1.  Open the Product Menu and go to *Site Builder* &rarr; *Pages* under the Site Menu. Alternatively, since Liferay DXP 7.3, you can click the (![icon-page-tree](../../icon-page-tree.png)) icon next to the Site name to open the Page Tree Menu.
    
2.  Click the Gear icon, or select *Configure* from the Actions Menu in the Page Tree Menu, next to the Page Set to configure its pages.

3.  Configure the options under the [*Look and Feel* tab](#look-and-feel) and [*Advanced* tab](#advanced) (if required) for the Page Set.
    
4.  Click *Save* to apply the updates to the Page Set.

The available Page Set settings are described below.

## Look and Feel

Page Set configuration starts with the *Look and Feel* tab. Here you can choose a Theme for the current site and update the logo.

![Figure 1: The Look and Feel page set tab.](./configuring-page-sets/images/01.png)

### Current Theme

Themes create the overall feel for the Site and can transform the look entirely. The *Current Theme* section displays the Theme currently applied to the Page Set, along with any configurable theme settings and color schemes that the Theme has. Many Themes include more than one color scheme, which keeps the existing look and feel while giving the Site a different flavor. The *CSS* section lets you enter custom CSS for tweaking your Theme. You can apply Themes to the entire Site (described here) or to individual pages (described in [Configuring Pages](./06-configuring-individual-pages.md#look-and-feel)). 

To apply a Theme to the Page Set, follow these steps:

1.  Click the *Change Current Theme* button and select the Theme from the window that appears.

2.  Configure the Theme's settings.

3.  Click *Save* to apply the new Theme to the Page Set.

![Figure 2: The Look and Feel interface allows you to choose a theme for the current site.](./configuring-page-sets/images/02.png)

See the [Themes](TODO) section for information on creating and developing your own custom Themes ([creating theme settings](TODO), [color schemes](TODO), etc.).

### Logo

By default, the Liferay logo is used for your Site's pages. To use your own logo for a Site, follow these steps:

1.  Expand the *Logo* panel under the *Look and Feel* tab.

2.  Click the *Change* button and browse to the location of your logo. Make sure your logo fits the space in the top left corner of the Theme you're using for your Site. If you don't, you could wind up with a Site that's difficult to navigate, as other page elements are pushed aside to make way for the logo.

3.  Choose whether to display the Site name on the Site. When *Show Site Name* is enabled, the Site name appears next to the logo. 

    > **Note:** This option is enabled by default and can't be disabled if the *Allow Site Administrators to set their own logo* option is disabled in *Instance Settings*. Removing the Site name is not available for the default Liferay Site---you can configure this only for new Sites and User pages.
    
4.  Click *Save* to apply the changes. 

## Advanced

>**Warning:** The *Advanced* tab contains powerful options that should only be used by those with a firm command of the technology, or they could have major unintended side effects. Proceed with caution.

### JavaScript

At the top of the *Advanced* tab is a JavaScript editor. Code entered here is executed at the bottom of every page in the Site. Your site's JavaScript is most likely (and should be) included with the Theme. However, this may be a good place to quickly test JavaScript code while not in production.

### Advanced

If you have multiple Sites on your Liferay Portal instance, one Site is marked as the *Default Site* that visitors are shown when they visit the Site. By default, only the default Site's Public Pages are displayed in the navigation. You can display the other Site's Public Pages in the default Site's navigation as well by enabling the *Merge public pages* option for that Site. Be careful, as adding too many pages to the main navigation can make it become unwieldy very quickly.

### Mobile Device Rules

*Mobile Device Rules* lets you configure behaviors for specific mobile devices or types for the Page Set. Mobile device rules are inherited from your Public Pages, but you can define specific rules per page. You can edit the Look and Feel of specific pages for mobile devices, including the theme. See [Mobile Device Rules](TODO) for more information.

### Robots

The *Robots* option lets you configure `robots.txt` rules for the domain's public and private pages. The `robots.txt` file provides instructions to search engines and other tools that are automatically crawling and indexing your Site. For example, you can specify not to index certain pages.

### Sitemap

The *Sitemap* option generates a sitemap you can send to some search engines so they can crawl your site. It uses the industry standard sitemap protocol. Select a search engine link to send the sitemap to it (only required once per Site), or select the *preview* link to see the generated XML that is sent to search engines.
