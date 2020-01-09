# Customizing Personal Sites

By default, newly created Users are granted a fully customizable personal Site, with Public Pages (public content such as a blog) and Private Pages (personal information or Documents and Media with private file repositories), and the User as the only member.

## Personal Site Permissions and Roles

Permissions and Roles for personal sites follow the behavior shown below:

* Users function as Site Administrators of their personal Sites; they can modify the pages and applications on their personal sites.
* Administrators can customize the modifiable portions of personal Sites through Liferay Portal's permissions system by removing permissions from Roles (disallow all Users from modifying something by removing the relevant permission from the User Role).

## Personal Site Properties

There are several portal properties you can add to `portal-ext.properties` to customize the default pages of personal Sites. You can customize the names of the pages, the applications that appear on the pages, the themes and layout templates of pages, and more. Please refer to the [Default User Public Layouts](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Default%20User%20Public%20Layouts) and [Default User Private Layouts](https://docs.liferay.com/portal/7.2-latest/propertiesdoc/portal.properties.html#Default%20User%20Private%20Layouts) sections of the `portal.properties` file for details. Some of these properties are listed in the table below:

| Functionality | Property |
| --- | --- |
| Disable personal Sites | `layout.user.public.layouts.enabled=false`
| Disable Private Pages on personal Sites | `layout.user.private.layouts.enabled=false` |
| Disable automatic creation of personal Sites | `layout.user.public.layouts.auto.create=false`
| Disable automatic creation of Private Pages on personal Sites | `layout.user.private.layouts.auto.create=false` |

The Public and Private Page Sets of personal Sites are handled separately. You can leave one Page Set enabled while disabling the other. If you initially had user personal Sites enabled for your instance but then disabled them, existing personal Sites remain on your instance until the next time users sign in, at which point they're removed.

