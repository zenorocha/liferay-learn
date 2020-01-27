# Creating Message Boards Threads

By default, only authenticated users with the requisite permissions (at minimum, _Add Message_, _Reply to Message_, _Add File_,and _View_) have the ability to create threads. See the [Message Boards Permissions Reference](./message-boards-permissions-reference.md) for more information. Administrators can enable the feature to allow guests to post threads.

## Posting a New Thread

Threads can be created at the root level of the Message Board itself and within [categories that have been created](./creating-message-boards-categories.md).

To create a new thread:

1. Click the Message Boards _New Thread_ button. The _Add Message_ form appears.
1. Enter a title in the **Subject** field.
1. Create your thread's content in the **Body** field.

   > **Note:** This field uses the same editor as the Blogs app, except that it uses BBCode instead of HTML. For further instructions, see the documentation on [using the editor](https://help.liferay.com/hc/articles/360018173051-Using-the-Blog-Entry-Editor-).

    ![Figure 1. Creating the first post](./creating-message-boards-threads/images/01.png)

### Uploading Attachments

Users can attach files to forum posts.

1. To add attachments, expand the _Attachments_ section.
1. Drag and drop a file to upload or use the *Select Files* button to navigate to the file's location.

    ![Figure 2. Uploading an attachment](./creating-message-boards-threads/images/03.png)

### Using _Tags_ and _Related Assets_ to Organize Threads

Besides using _Categories_ to organize the threads, users can add a tag to a forum post. If searching for content using this tag (for example, _Toyota_), all posts with the _Toyota_ will be returned faster.

1. Expand the _Categorization_ section.
1. Click the _Select_ button to select an existing tag. Alternately, create a new tag by entering the tag name in the _Tags_ field and clicking _Add_. See [the documentation on tags](https://help.liferay.com/hc/articles/360028820472-Tagging-Content) for more information.

The message board post now has a tag.

Message Boards threads can be linked to other existing assets in DXP.

1. To select an existing asset in the portal (e.g., a media file, blog post, etc.) to relate to your thread, expand the _Related Assets_ section and use the _Select_ button to select that asset.

    ![Figure 3. Adding a Tag and Related Asset](./creating-message-boards-threads/images/04.png)

### Set the Thread's Priority

A Message Boards thread can be prioritized as _Urgent_, _Sticky_, or _Announcement_. By default, it is set to "None".

1. Expand the _More Settings_ section.

    ![Figure 4. Setting a thread priority](./creating-message-boards-threads/images/07.png)

1. Select the thread's priority.
1. Click _Publish_.

The new post has been created. Site administrators have the ability to move this post to another category at a later time.

## Using Threads as Questions

Message Boards Threads can be more than just sharing ideas and opinions. Forum members can turn their post into a question for other site members. The reply that best answers the question can be marked as the answer.

To make a thread post a question:

1. Click the _New Thread_ button.
1. Expand the _More Settings_ section.
1. Check the box for _Mark as a Question_.

    ![Figure 5. Marking a thread as a question](./creating-message-boards-threads/images/05.png)

To select a reply as the answer:

1. Click the 3-dot icon.
1. Click _Mark as an Answer_.

    ![Figure 6. Replies can be marked as an answer to a message board question.](./creating-message-boards-threads/images/02.png)

1. Click _Publish_ to publish the thread.

## Message Board Thread Replies

Click a thread to view it. Messages appear in a threaded view so that replies are aligned under their parent thread. This makes it easy to follow conversations. Thread replies are indented under their parent thread.

![Figure 7: A thread's view displays author information and thread content, for the thread and all replies to the thread.](./creating-message-boards-threads/images/06.png)

To reply to a message in a thread:

1. Click the _Reply_ button. This opens the quick reply form, which only contains a text field for entering your reply.
1. Enter your reply in the text field. To access more options for your reply, click the _Advanced Reply_ link. This opens the full editor from the add/edit thread form.
1. Click _Publish_.

In addition to replying to a message, you can rate it or flag it as objectionable. A message board moderator can evaluate flagged messages and decide how to handle the messages and their authors.

## Additional Information

* [Creating Message Boards Categories](./creating-message-boards-categories.md).
* User can [mention other users](https://help.liferay.com/hc/en-us/articles/360028720892-Mentioning-Users) by entering the `@` character and their user name.
* See the [Configuration Reference](./message-boards-configuration-reference.md).
 To learn more about the generic Roles and Permissions, see [Roles and Permissions](https://help.liferay.com/hc/articles/360017895212-Roles-and-Permissions).