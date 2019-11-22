# Pruning the Database

The more data you have the longer your data upgrade takes. Unneeded site data is a common occurrence. Pruning the database of unneeded data quickens your data upgrade. 

For example, you may have many unused versions of Web Content articles or Documents and Media files. If you're done revising them and don't need the intermediate revisions, you can safely remove them. This saves you space and upgrade time.

## Remove Duplicate Web Content Structure Field Names

If you've used Web Content Management extensively, you might have structures without unique field names. Find and remove duplicate field names before upgrading. If you upgraded to Liferay Portal 6.2 previously and skipped doing  this, you'll encounter this error: 

```
19:29:35,298 ERROR [main][VerifyProcessTrackerOSGiCommands:221] com.liferay.portal.verify.VerifyException: com.liferay.dynamic.data.mapping.validator.DDMFormValidationException$MustNotDuplicateFieldName: The field name page cannot be defined more than once
com.liferay.portal.verify.VerifyException: com.liferay.dynamic.data.mapping.validator.DDMFormValidationException$MustNotDuplicateFieldName: The field name page cannot be defined more than once
```
 
If this error occurs, roll back to your previous backup of Liferay Portal 6.2 and find and remove the duplicate field names.

## Find and Remove Unused Objects

Identify unused objects in the UI or using database queries. Then remove them via the UI or using Liferay DXP's API through the [script console](/docs/7-2/user/-/knowledge_base/u/running-scripts-from-the-script-console) or a portlet you create. 

**Warning**: You should only use Liferay's UI or API because they account for relationships between objects in Liferay DXP. Never use SQL directly on your database to remove records. Your SQL might miss object relationships, orphaning objects and causing performance problems.

Listed below are some common places to check for unused objects.

### Objects From the Large/Populated Tables

Table rows are mapped to objects in Liferay DXP. Large tables with many records might contain many unused objects. The greater the table size and the records per table, the longer upgrading takes.

Finding and removing unused objects associated with such tables reduces upgrade times. Your data import log (from the previous step) can provide valuable table information. Database engines show this information in different ways. For example, your database import log might look like this:

```
Processing object type SCHEMA\_EXPORT/TABLE/TABLE\_DATA

imported "LIFERAY"."JOURNALARTICLE" 13.33 GB 126687 rows

imported "LIFERAY"."RESOURCEPERMISSION" 160.9 MB 1907698 rows

imported "LIFERAY"."PORTLETPREFERENCES" 78.13 MB 432285 rows

imported "LIFERAY"."LAYOUT" 52.05 MB 124507 rows

imported "LIFERAY"."ASSETENTRY" 29.11 MB 198809 rows

imported "LIFERAY"."MBMESSAGE" 24.80 MB 126185 rows

imported "LIFERAY"."PORTALPREFERENCES" 4.091 MB 62202 rows

imported "LIFERAY"."USER\_" 17.32 MB 62214 rows

...
```

Several items stand out in the example database import:

-   The `JOURNALARTICLE` table makes up 98% of the database size.
-   There are many `RESOURCEPERMISSION` records.
-   There are many `PORTLETPREFERENCES` records.

Search for unused objects associated with the tables that stand out and use Liferay's API (e.g., using the [script console](/docs/7-2/user/-/knowledge_base/u/running-scripts-from-the-script-console)) to delete unneeded objects. 

### Common Object Types Worth Checking 

Some specific object types should be checked for unused objects. Here are some reasons for checking them:

- Removing them frees related unused objects for removal
- They're version objects that aren't worth keeping

Check these object types: 

- **Sites**: Remove sites you don't need. When you remove a site, this will remove its related objects, including:

    - Layouts

    - Portlet preferences

    - File entries (document library objects)

    - Asset Entries

    - Tags

    - Vocabularies and categories

    - Expando fields and their values

    - `ResourcePermission` objects

    - All other objects unique to the site 

- **Instances**: Unused instances are rare, but since they are the highest object in the hierarchy, removing their objects can optimize upgrades considerably. Removing instances removes these objects associated with them:

    - Sites (and all their related content)

    - Users

    - Roles

    - Organizations

    - Global `ResourcePermission` objects

- **Intermediate web content versions:** Liferay DXP generates a new web content version after any modification (including translations). Consider removing versions you don't need. This may free up significant space, especially if the removed versions have objects such as image files specific to those versions. For more details, see [Example: Removing Intermediate Journal Article Versions](./03-example-removing-intermediate-journal-article-versions.md).

- **Document versions**: As with Journal Articles, if you don't need intermediate document versions, delete them. This saves space both in the database and on the file system.

- **Layouts:** Layouts are site pages, and they affect upgrade performance because they relate to other entities such as portlet preferences, permissions, assets, ratings, and more. Remove unneeded layouts. 

- **Roles**: Remove any Roles you don't need. Deleting them also deletes
    related `ResourceBlockPermission` and `ResourcePermission` objects.

- **Users:** Remove Users that are inactive and no longer needed.

- **Vocabularies**: Remove any unused vocabularies. Note that removing a vocabulary also removes its categories.

- **Orphaned data**: Check for unused objects that are not connected to anything. Here are some examples:

    - `DLFileEntries` with no file system data.

    - `ResourcePermission` objects associated to a Role, Layout, User, portlet instance, etc. that no longer exists.

    - `PortletPreference` objects associated with a portlet or layout that no longer exists. This is common in environments with many embedded portlets. These portlet instances have a different lifecycle and aren't deleted when the portlet is removed from a template.

To see an example of removing intermediate object versions, read [Example: Removing Intermediate Journal Article
Versions](./03-example-removing-intermediate-journal-article-versions.md).

Next, you'll test your instance with its pruned database. 

## Test with a Copy of the Pruned Database

Find and resolve any issues related to the objects you removed. This is an important step, in case objects were mistakenly removed, or if this affects other content. You can always restart pruning a new copy of your production database if you can't resolve an issue.
