# Master Page Templates Intro

Master Page Templates provide a way to define elements common to every page (e.g. Headers and Footers previously provided by Themes) using Fragments, so you can easily maintain and manage them in Portal without having to deploy a plugin. You can use the same Master Page Template across an entire Site or have a unique one for each page. Each Page and Page Template must have an associated Master Page Template. By default, this is the "Blank" Master, which doesn't provide any common elements.

![The Blank Master Page Template is the default for Pages, and Page Templates.](./master-pages/images/01.png)

## Building Master Page Templates

Building a Master Page Template is very similar to the process of creating a Content Page. A Master Page Template can contain any number of Page Fragments, like a Content Page. However, a Master Page Template differs in that it has one key area defined, called a *Drop Zone*, that specifies where you can place Page Fragments. This area can't be removed, but it can be drag and dropped somewhere else in the page layout. You can also define which Page Fragments can be added to the Drop Zone. A typical use case for a Master Page Template is to have a Header, a Footer, and a Drop Zone. See [Creating Custom Master Pages](./creating-a-master-page-template.md) for more information.

![A typical use case for a Master Page Template has a Header, a Drop Zone, and a Footer.](./master-pages/images/02.png)