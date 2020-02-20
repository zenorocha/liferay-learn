# Creating a Widget Template

Widget templates are used to customize the appearance and functionality of various existing widgets. Creating a widget template allows you to use a script to adapt the widget however you see fit. You can create a widget template for many out-of-the-box portlets, such as the _Asset Publisher_ and _Media Gallery_ widgets.

## Steps to Create a Widget Template

Follow these steps to create a widget template

1. From the Product Menu, click _Site Builder_ → _Widget Templates._

    ![The Widget Template page.](./creating-a-widget-template/images/01.png)

1. Click the _Add_ ![Add icon](../../images/icon-add.png) button, then select which widget to create a widget template for (e.g., _Asset Publisher_).

    ![The Widget Template creation page.](./creating-a-widget-template/images/02.png)

1. Add a name for your widget template.

1. Under the _Script_ section, click into the body of the template editor.

1. Click one of the fields in the _Fields_ menu to insert that field into the editor. The value of the field will be displayed when your widget template is used.

    ```note::
       Clicking any of the fields in the menu will insert the field name wherever the cursor is. You can also begin typing a field name yourself (starting with "${") to show suggestions for auto-completion.
    ```

1. Click _Save_ to complete the template.

Now that you have created a widget template, you can configure the corresponding widget to use your template. See [Customizing a Widget with a Widget Template](./customizing-a-widget-with-a-widget-template) for more information.