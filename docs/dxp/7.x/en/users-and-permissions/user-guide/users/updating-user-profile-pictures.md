# Updating User Profile Pictures

Users have profile pictures. Administrative Users can upload images in the Edit User form, and Users can update their own account information, including profile image.

## Updating a Profile Picture

To update a User profile picture follow these steps:

1. Click *My Profile* in the User menu or if you're an administrator, go to *Control Panel* &rarr; *Users and Organizations* and find the User that needs a profile picture.
1. Click the *Change* button under the generic profile picture.
1. Select an image from your computer, crop it (if necessary), and then click *Done*.

![Upload images for user avatars in the Edit User form.](./updating-user-profile-pictures/images/01.png)

The Profile image is now updated.

## Changing the Default User Profile Picture Image

If no image is explicitly uploaded for a User's profile picture, a default User icon is assigned as the User avatar comprised of the User's initials (First Name then Last Name) over a random color.

![The default user profile picture is an icon with the user initials over a randomly colored bubble.](./updating-user-profile-pictures/images/02.png)

### Disable the Use of Initials for the Default User Profile Image

1. Navigate to *Control Panel* &rarr; *Configuration* &rarr; *System Settings*.
1. In the Platform section, click *Users* &rarr; *User Images*.
1. De-select *Use Initials for Default User Portrait*.

![If you disable the default initials-based profile picture, this icon is used instead.](./updating-user-profile-pictures/images/03.png)

Now, instead of the default icon, the icon is a generic silhouette.

### Changing the Order of Initials in the Default User Profile Image

The default user icon (with the user initials) can be configured to work for your locale. These settings are configured in a [Language Settings module](../../platform/adding-language.md).

`lang.user.default.portrait=initials` sets the type of icon to use for avatars. The default value is *initials*. If set to initials, the next property configures which initials to display, and in what order. Alternatively, specify *image*, which gives you the same non-initials default image shown above.

`lang.user.initials.fields=first-name,last-name` determines which initials appear in the user portrait and in what order. The setting here only matters if `lang.user.default.portrait` is set to *initials*.  Valid values are `first-name`, `middle-name`, `last-name`, with first and last name as the defaults.

### Using a Custom Default Profile Image

You can use your own default profile image:

1. Create at least one image that is a 100x100 px square in .png or .jpg format.

1. Place it somewhere on the application server's classpath. For example, in Tomcat you could place it in the `tomcat/webapps/ROOT/WEB-INF/classes` folder.

1. Set the following property in a [`portal-ext.properties`](../../../../installation-and-upgrades/reference/portal-properties.md) file:

    ```properties
    image.default.user.portrait=image-filename-here.png
    ```

    This overrides the value of this portal property:

    ```properties
    image.default.user.portrait=com/liferay/portal/dependencies/user_portrait.png
    ```

    ```tip::
       If you use the binary gender field to collect information on users' genders, then you have two default images to override. Set these properties instead:
       ::
         image.default.user.female.portrait=image-filename.png
         image.default.user.male.portrait=image-filename.png
    ```

1. Restart the application server.

<!-- ## Related Information

* link
* link -->
