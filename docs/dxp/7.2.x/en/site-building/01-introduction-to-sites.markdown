# Introduction to Site Building

A Site is a set of pages where content or applications are published. Sites can be independent or serve as an associated organization's website. You can create as many different sites as you like within the context of a single Liferay Portal instance. You can have many Sites on one Liferay instance, which work together to create one complete website, or you can simply have one Site which contains all of your pages and content---or anything in between. These topics are covered in this introduction:

- [Site Use Cases](#site-use-cases)
- [The Default Main Site](#the-default-main-site)
- [Site Scope](#site-scope)
- [Page Sets](#page-sets)

## Site Use Cases

Building a corporate intranet is a typical use case for Sites. A corporate intranet could have Sites for all the organizations in the company: Sales, Marketing, Information Technology, Human Resources and so on. But what about the corporate health and fitness center? That's something everybody in the company, regardless of organization, may want to join. This makes it a good candidate for an open and independent Site. Similarly, the home page for a corporate intranet should probably be placed in an open independent Site so any member of the instance can access it.

For other kinds of websites, you may want to use independent Sites to bring Users together who share a common interest. If you were building a photo sharing website, you might have independent Sites based on the types of photos people want to share. For example, those who enjoy taking pictures of landscapes could join a Landscapes Site, and those who enjoy taking pictures of sunsets could join a Sunsets Site.

## The Default Main Site

There is always one default Site, which is also known as the main Site of the instance. This Site doesn't have its own name but rather takes the name of the instance. By default the instance name is *Liferay*, but this value can be changed through the configuration of the setup wizard. You can also change the instance name later on if you need to through the Control Panel:

1.  Open the Product Menu.

2.  Open the Control Panel and go to *Configuration &rarr; *Instance Settings* &rarr;, and click *Instance Configuration* under the PLATFORM heading.

3. Select the *General* tab under VIRTUAL INSTANCE SCOPE and enter a new name in the *Name* field of the General form.
    
4.  Click *Save* to apply the changes to the instance configuration.

## Site Scope

Members of a Site can be given additional privileges in the Site by using permissions. It is also possible to assign different Roles within the Site to different members. This can be done through *Site Roles*, which are defined equally for all Sites or *Teams* which are unique for each Site. These concepts are discussed in [Site Roles](TODO) and [Creating Teams for Sites](https://github.com/liferay/liferay-learn/tree/master/docs/dxp/7.2.x/en/site-building/01-building-sites/06-creating-teams-for-sites.markdown) respectively.

Liferay Portal separates Site-scoped information from the Control Panel by placing it in the Site menu. To access Site-scoped settings,

1. Open the Product Menu and click your Site name.

2. Click the compass icon next to the Site name to select the specific Site to work on. 

3. With the Site selected, access the Build, Content & Data, Categorization, Recycle Bin, Members, Configuration, Publishing options and more from the site's panel.

![Figure 1: Your Site's content resides in the Site Administration menu.](/images/web-content-site-content.png)

## Page Sets

A Site is composed of two kinds of Page Sets:

- **Public Pages:**

  - Can be accessed by anyone, including Users who haven't logged in
  
  - has URLs different from Private Pages and can have unique content, applications, themes, and layouts

- **Private Pages:**

  - Can only be accessed by Site members
  
  - Has URLs different from Public Pages and can have unique content, applications, themes, and layouts

A Site can have public pages, private pages, or both. It's possible to restrict access to pages at the Page Set level or at the level of individual pages through the permissions system. 
