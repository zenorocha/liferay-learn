# Configuring a Shutdown Event in Server Administration

In the Shutdown tab you can initiate a graceful shutdown event, warning Users of the impending shutdown and instructing them to save any work in progress.

When you schedule a shutdown, Liferay DXP displays a system warning message and a message you define at the top of users' pages. When time expires, all pages display your custom message. Once the server is restarted, access is restored.

## Adding a Shutdown Event

To add a shutdown event, first enable the Inactive Request Handler configuration in system Settings:

1. Navigate to Control Panel &rarr; Configuration &rarr; System Settings, and search for _Inactive Request Handler_.

1. Enable _Show Inactive Request Message_ and click _Save_.

This enables display of a message to Users that try to navigate somewhere in Liferay DXP after the shutdown happens. Without this they'll have the unfriendly experience of seeing a totally blank page.

Now configure the shutdown itself:

1. Navigate to Control Panel &rarr; Configuration &rarr; Server Administration, and click the _Shutdown_ tab.

1. Enter the time (in minutes) until the shutdown happens.

1. Enter a special message. Whatever you enter is appended to the system default message:

    `Maintenance Alert 4:48 PM EST The portal will shut down for maintenance in 5 minute(s). You will automatically be signed out at that time. Please finish any work in progress. After the maintenance has been completed, you will be able to successfully sign in. [YOUR MESSAGE DISPLAYS HERE]`

   In addition, this message is what Users see if they navigate to a portal page after the shutdown (because you enabled the _Show Inactive Request Message_ setting).

1. Click _Save_. The countdown to the shutdown event begins immediately.

![The time until shutdown and the warning message are configurable in the Shutdown tab.](./configuring-a-shutdown-event-in-server-administration/images/01.png)

Right away, all logged in Users see the system message and your appended custom message at the top of the page.

![Users are showed a warning about the impending shutdown.](./configuring-a-shutdown-event-in-server-administration/images/03.png)

Once the time has expired, logged in Users trying to navigate to a page in Liferay DXP see your custom message (perhaps with an invitation to return later), rather than a blank page with no information.

![Your custom message is displayed to Users after the shutdown.](./configuring-a-shutdown-event-in-server-administration/images/02.png)

## Canceling a Shutdown Event

At any time before the shutdown has occurred, you can cancel it.

1. Navigate to Control Panel &rarr; Configuration &rarr; Server Administration, and click the _Shutdown_ tab.

   If a shutdown event is scheduled, you can only do one thing: cancel it.

1. Click _Cancel Shutdown_.

Now the scheduled shutdown messages disappear and the portal functions as as usual.
