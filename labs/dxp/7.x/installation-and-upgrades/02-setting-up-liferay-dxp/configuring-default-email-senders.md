# Configuring Default Email Senders

Email senders are the default name and email address DXP uses to send administrative emails and announcement emails. Default email senders are configured in the [`portal-ext.properties` file](../14-reference/03-portal-properties.md). Replace the names and email addresses below with your values.

Here are some important configurations:

## Admin email configuration

    ```properties
    admin.email.from.name=Joe Bloggs
    admin.email.from.address=test@domain.invalid
    ```

## Announcements email configuration

    ```properties
    announcements.email.to.name=
    announcements.email.to.address=noreply@domain.invalid
    ```

## Blacklisted Emails

The following emails are blacklisted by default and cannot be used in any DXP installation:

    * `noreply@liferay.com`
    * `test@liferay.com`
    * `noreply@domain.invalid`
    * `test@domain.invalid`

    Otherwise, DXP logs a `WARN` trace:

    ```
    Email xxx will be ignored because it is included in mail.send.blacklist
    ```
