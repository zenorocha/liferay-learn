# Synchronizing Users and User Groups With an LDAP Directory

Coming soon!

<!-- The import/export settings configure mappings between LDAP and Liferay to match users between the two systems.

## Users

This section contains settings for finding users in your LDAP directory.

**Authentication Search Filter:** Use this search filter box to determine the search criteria for user logins. By default, Liferay uses users' email addresses for their login names. The value here must use the authentication method you use. For example, if you changed Liferay's authentication method to use screen names instead of the email addresses, you would modify the search filter so it can match the entered log in name:

    (cn=@screen_name@)

**Import Search Filter:** Depending on the LDAP schema, there are different ways to identify the user. The default setting is usually fine:

    (objectClass=inetOrgPerson)

If you want to search for only a subset of users or users that have different LDAP object classes, you can change this.

**User Mapping:** Next, you can define mappings from LDAP attributes to Liferay fields. Though LDAP user attributes may be different from LDAP server to LDAP server, there are five fields Liferay requires to be mapped for the user to be recognized:

-   *Screen Name* (e.g., `uid` or `cn`)
-   *Password* (e.g., `userPassword`)
-   *Email Address* (e.g., `mail` or `email`)
-   *First Name* (e.g., `name` or `givenName`)
-   *Last Name* (e.g., `sn`)

**Note:** If you intend to create or import users with no email addresses, you must set `users.email.address.required=false` in `portal-ext.properties`. With this set, Liferay auto-generates an email address combining the user ID plus the suffix defined in the property `users.email.address.auto.suffix=`. Finally, make sure to set Liferay and LDAP authentication to something other than email address.

If you want to import LDAP groups as Liferay user groups, make sure you define a mapping for the Liferay group field so that membership information is preserved:

  -   *Group* (e.g., *member*)

The other LDAP user mapping fields are optional.

The Control Panel provides default mappings for commonly used LDAP attributes. You can also add your own mappings.

**Test LDAP Users:** Once you have your attribute mappings set up (see above), click the *Test LDAP Users* button and Liferay attempts to pull LDAP users and match them with their mappings as a preview.

![You should see a list of users when you click the Test LDAP Users button.](./images/testing-ldap-users.png)

## Groups

This section contains settings for mapping LDAP groups to Liferay user groups.

**Import Search Filter:** This is the filter for mapping LDAP groups to Liferay user groups. For example,

    (objectClass=groupOfNames)

Enter the LDAP group attributes you want retrieved for this mapping. The following attributes can be mapped. The *Group Name* and *User* fields are required, the *Description* is optional.

  - *Group Name* (e.g., `cn` or `o`)

  - *Description* (e.g., `description`)

  - *User* (e.g., `member`)

**Test LDAP Groups:** Click the *Test LDAP Groups* button to display a list of the groups returned by your search filter.

## Export

This section contains settings for exporting Liferay user data to LDAP.

**Users DN:** Enter the location in your LDAP tree where the users are stored. Liferay exports the users to this location.

**User Default Object Classes:** Users are exported with the listed default object classes. To find out what your default object classes are, use an LDAP browser tool such as Apache Directory Studio to locate a user and view the Object Class attributes stored in LDAP for that user.

**Groups DN:** Enter the location in your LDAP tree where the groups are stored. When Liferay does an export, it exports the groups to this location.

**Group Default Object Classes:** When a group is exported, the group is created with the listed default object classes. To find out what your default object classes are, use an LDAP browser tool such as [Apache Directory Studio](https://directory.apache.org/studio) to locate a group and view the Object Class attributes stored in LDAP for that group.

When you've set all your options and tested your connection, click *Save*.

**Note:** If a user changes a value like a password in Liferay, that change is passed to the LDAP server, provided Liferay has enough schema access to make the change.

Now you know how to connect an LDAP server to Liferay and how to configure user import behavior, export behavior, and other LDAP settings. There are other configurable options; [Configuring LDAP](./03-configuring-ldap.md) describes those. -->
