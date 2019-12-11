# Site Hierarchies

Sites can be organized hierarchically, just like Organizations, with child Sites. The difference between Sites and Organizations is that Sites organize pages, content, application data, and Users (via site memberships), whereas Organizations only group users. Site hierarchy is discussed in more detail below.

- [Site Hierarchy Roles and Permissions](#site-hierarchy-roles-and-permissions)
- [Content Sharing between Sites](#content-sharing-between-sites)
- [Site Hierarchy Applications](#site-hierarchy-applications)
  - [The Sites Directory Application](#the-sites-directory-application)
  - [The Site Map Application](#the-site-map-application)

## Site Hierarchy Roles and Permissions

These rules apply to Site hierarchy:

- Each child site in the hierarchy has its own Administrator

- The Site Administrator Role permissions don't flow down to child sites in the hierarchy

- If a Site Administrator creates a child site, he or she has the same permissions in that child site (This isn't because of inheritance, but rather it's because creating a Site makes you the Owner of that Site). 

- A Site Administrator has no default Role in any child sites created by other Site Administrators. 

>**Note:** If you want a user to have administrative access to all sites in a site/child site hierarchy, you must create a Role based on the Site Administrator Role that has the permission *Manage SubSites*. 

## Content Sharing Between Sites

Content sharing is available for sites within the same hierarchy. For instance, if a parent site has a document type called *Devcon Presentation* and all its child sites should have a copy, the parent site's administrator can enable content sharing to share the document type automatically with its child sites. Also, content sharing privileges can be set to let every Site Administrator share content across sites they manage. You can share these content types across sites:

- Web Content Structures
- Web Content Templates
- Document Types
- Vocabularies and Categories
- Widget Templates
- Data Definitions (Dynamic Data Lists)

Please refer to the [Sites Admin Portlet](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Sites%20Admin%20Portlet) section of Liferay Portal's `portal.properties` file for a list of relevant configurable properties. For example, the `Sites.content.sharing.with.children.enabled` property can disable/enable content sharing between sites and child sites, while letting Site Administrators configure it per site.


## Site Hierarchy Applications

Liferay Portal includes site-specific applications out-of-the-box that let you view the hierarchy. These applications are discussed below.

### The Sites Directory Application

The Sites Directory application is a configurable app that shows a hierarchy of sites and child sites. It enables users to navigate to any of the displayed sites. To use this app to display site hierarchies, follow these steps:

1.  Add the Sites Directory application to a page

2.  Open its Configuration window

3.  Select *List Hierarchy* under Display Style 

The My Sites Directory application is similar to the Sites Directory application, except that it lists only the sites a user belongs to.

### The Site Map Application

The Site Map application helps users navigate a site. A Site Administrator can configure a root page and a display depth. Just as sites can have hierarchies, so can the pages within a site. The display depth of the Site Map application determines how many levels of nested pages to display.

![Figure 1: The Site Map application lets Users navigate among pages of a site organized hierarchically.](./images/site-directory-site-map.png)