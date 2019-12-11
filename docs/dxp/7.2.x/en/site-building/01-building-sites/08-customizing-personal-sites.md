# Customizing Personal Sites

By default, newly created Users are granted a fully customizable personal site, of which they're the only member, with Public Pages (public content such as a blog) and Private Pages (personal information or Documents and Media with private file repositories). 

## Personal Site Permissions and Roles

Permissions and Roles for personal sites follow the behavior shown below:

- Users function as Site Administrators of their personal sites; they can modify the pages and applications on their personal sites.

- Administrators can customize the modifiable portions of personal sites through Liferay Portal's permissions system by removing permissions from Roles (disallow all Users from modifying something by removing the relevant permission from the User Role).

## Personal Site Properties

There are several portal properties you can add to `portal-ext.properties` to customize the default pages of personal sites. You can customize the names of the pages, the applications that appear on the pages, the themes and layout templates of pages, and more. Please refer to the [Default User Public Layouts](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Default%20User%20Public%20Layouts) and [Default User Private Layouts](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Default%20User%20Private%20Layouts) sections of the `portal.properties` file for details. Some of these properties are listed in the table below:

| Description | Property |
| --- | --- |
| disable personal sites | `layout.user.public.layouts.enabled=false`
|  | `layout.user.private.layouts.enabled=false` |
| disable automatic creation of personal sites | `layout.user.public.layouts.auto.create=false`
|  | `layout.user.private.layouts.auto.create=false` |

The Public and Private Page Sets of personal sites are handled separately. You can leave one Page Set enabled while disabling the other. If you initially had user personal sites enabled for your instance but then disabled them, existing personal sites remain on your instance until the next time users sign in, at which point they're removed.

Great! Now you know how to customize a personal site!
