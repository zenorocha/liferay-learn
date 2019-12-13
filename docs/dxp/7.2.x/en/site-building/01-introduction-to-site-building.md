# Introduction to Site Building

<!-- An alternative outline for this article - please read less as: "use these exact words", and more like: here are core ideas that you may want to communicate. -->

<!-- Introduction -->
Sites are a core functional element of Liferay DXP. At its most basic, a Liferay DXP Site is a collection of pages where content or applications are displayed.

There are a wide variety of configurations available for Liferay Sites to achieve a desired goal: x, y, and z.

<!-- Overall thoughts on this introduction: needs a lot of work. The article doesn't fully accomplish the goal of introducing someone to what a Liferay Site is and what array of functionality is available to someone who wants to use Liferay to build a site. The article also introduces some concepts (Default Main Site, Site Scope) that aren't fully explained or contextualized as to why they are important for someone to know in this particular article. -->

A Site is a set of pages where content or applications are published. <!-- do people know what this even means at this point? What does it mean for a site to be independent in the context of Liferay? What does it mean for a site to be associated as an organization's website? --> Sites can be independent or serve as an associated organization's website. <!-- Yes, but does is this an important enough fact to mention in this introductory paragraph? --> You can create as many different Sites as you like within the context of a single Liferay Portal instance. <!-- This seems to repeat what was written in the previous sentence --> You can have many Sites on one Liferay instance, which work together to create one complete website, or you can simply have one Site which contains all of your pages and content, or anything in between. These topics are covered in this introduction:

- [Site Use Cases](#site-use-cases)
- [The Default Main Site](#the-default-main-site)
- [Site Scope](#site-scope)
- [Page Sets](#page-sets)

## Site Use Cases

<!-- Not a big fan of this section because it reads in an overly colloquial way and doesn't help (for me) add additional value. -->
Building a corporate intranet is a typical use case for Sites. A corporate intranet could have Sites for all the organizations in the company: Sales, Marketing, Information Technology, Human Resources and so on. But what about the corporate health and fitness center? That's something everybody in the company, regardless of organization, may want to join. This makes it a good candidate for an open and independent Site. Similarly, the home page for a corporate intranet should probably be placed in an open independent Site so any member of the instance can access it.

For other kinds of websites, you may want to use independent Sites to bring Users together who share a common interest. If you were building a photo sharing website, you might have independent Sites based on the types of photos people want to share. For example, those who enjoy taking pictures of landscapes could join a Landscapes Site, and those who enjoy taking pictures of sunsets could join a Sunsets Site.

## The Default Main Site

<!-- What does it mean for there to be a default main site? What are the implications? Why is this information important for the reader to know at this point? --> There is always one default Site, which is the main Site of the instance. This Site doesn't have its own name but rather takes the name of the instance. By default the instance name is *Liferay*, but this value can be changed through the configuration of the setup wizard. You can also change the instance name at any time through the Control Panel:

1. Open the Product Menu.

2. Open the Control Panel and go to *Configuration &rarr; *Instance Settings* &rarr;, and click *Instance Configuration* under the PLATFORM heading.

3. Select the *General* tab under VIRTUAL INSTANCE SCOPE and enter a new name in the *Name* field of the General form.

4. Click *Save* to apply the changes to the instance configuration.

## Site Scope

<!-- This seems pretty specific for the introductory article...Also the header is "Site Scope" but we talk mostly Roles and Site Roles in the paragraph below. --> Members of a Site can be given additional privileges in the Site by using permissions. It is also possible to assign different Roles within the Site to different members. This can be done through *Site Roles*, which are defined equally for all Sites or *Teams* which are unique for each Site. These concepts are discussed in [Site Roles](TODO) and [Creating Teams for Sites](./01-building-sites/06-creating-teams-for-sites.md) respectively.

<!-- As a reader, at this point, I feel lost because I site scope has not really been defined to me. -->

Liferay DXP separates Site-scoped information from the Control Panel by placing it in the Site menu. To access Site-scoped settings:

1. Open the Product Menu and click your Site name.

2. Click the compass icon next to the Site name to select the specific Site to work on.

3. With the Site selected, access the Build, Content & Data, Categorization, Recycle Bin, Members, Configuration, Publishing options and more from the Site's panel.

![Figure 1: Your Site's content resides in the Site Administration menu.](/images/web-content-site-content.png)

## Page Sets

A Site is composed of two kinds of Page Sets:

- **Public Pages:**

  - Can be accessed by anyone, including Users who haven't logged in
  
  - Has URLs different from Private Pages and can have unique content, applications, themes, and layouts

- **Private Pages:**

  - Can only be accessed by Site members
  
  - Has URLs different from Public Pages and can have unique content, applications, themes, and layouts

A Site can have Public Pages, Private Pages, or both. It's possible to restrict access to individual pages or entire Page Sets through the permissions system.
