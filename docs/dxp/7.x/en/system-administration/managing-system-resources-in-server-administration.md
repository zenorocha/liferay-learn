# Managing System Resources in Server Administration

The Server Administration panel's Resources tab contains several functionalities, all related to low-level monitoring and management of the system's resources:

| Function | Purpose       |
| --------- | ------------ |
| System Information | Obtain the Liferay DXP version and uptime data |
| Memory Monitor | Monitor the Used Memory against the Total Memory and Max Memory |
| System Actions | Run the garbage collector and generate thread dumps | 
| Cache Actions | Clear cached content at various levels | 
| Verification Actions | Verify database accuracy and membership policies | 
| Cleanup Actions | Reset Docs and Media previews and thumbnails; clean up permissions and orphaned portlet preferences for themes and page revisions | 

![The Resources tab of Server Administration lets you execute several server maintenance tasks.](./managing-resources-in-server-administration/images/01.png)

## Server Administration: Resources Reference

**Run the Garbage Collector:** Tell the JVM to free memory by running the garbage collector. 

**Generate a Thread Dump:** Generate a thread dump for later scrutiny to determine the presence and location of any deadlocks. This can be useful during performance testing, if you first add a logger category for `com.liferay.server.admin.web.internal.portlet.action.EditServerMVCActionCommand` and set it to `INFO`.

**Clear Content Cached by This VM:** Clear content stored in the local cache. Only local JVM scope Ehcache content is cleared, not clustered Ehcache. [1](#one)

**Clear Content Cached Across the Cluster:** Clear the content of the entire clustered Ehcache. [1](#one)

**Clear the Database Cache:** Clear the database cache. This doesn't clear any Ehcache content except database results at the persistence layer. [1](#one)

**Clear the Direct Servlet Cache:** Clear the direct servlet cache. If emergency fixes must be applied, this action clears out the cache manually, forcing JSPs to reload.

The direct servlet context optimizes JSP serving performance by caching and accessing the generated servlets directly instead of accessing them over the application server's dispatcher chain. This function is only suitable for cases where no filter is required for the JSPs; it should be enabled for production mode to improve performance, but disabled for development mode to allow JSP servlets to be reloaded on the fly. See the Direct Servlet Context section of the `portal.properties` file for details. [1](#one)

**Verify Database Tables of All Plugins:** Check all tables against their indexes for data retrieval accuracy.

**Verify Membership Policies:** Check that existing Site membership policies were correctly applied and automatically apply updates. If the database is changed manually or hacked---resulting in a user assigned to a Site in violation of a site membership policy---this action triggers the verification methods of all implemented Site membership policies. Changes are automatically made to any memberships in violation.

**Reset Preview and Thumbnail Files for Documents and Media:** Regenerate previews of each item in your Documents and Media libraries.

**Clean Up Permissions:** Remove permissions on the Guest, User, and Power User Roles to simplify the management of User Customizable Pages. The Add To Page permission is removed from the Guest and User Roles for all portlets, and is reduced in scope for Power Users from portal-wide to User Personal Site.

**Clean Up Orphaned Page Revision Portlet Preferences:**This process removes all orphaned portlet preferences that belong to page revisions. Portlet preferences that belong to a portlet that does not belong to a page revision will be removed. Portlet preferences that belong to runtime portlets will also be removed.

**Clean Up Orphaned Theme Portlet Preferences:** This process removes all orphaned portlet preferences added by themes.Clean up database entries if portlet preferences become orphaned in the database.

[<a name="one">1</a>] Caching occurs at multiple levels. Some higher caching layers aren't aware of lower caching layers. Always clear the cache at the lowest (most granular) layer possible, even if you've already cleared a higher level cache.
