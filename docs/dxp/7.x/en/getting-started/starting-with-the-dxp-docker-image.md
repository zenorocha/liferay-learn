# Starting With The DXP Docker Image

Follow these steps to quickly take Liferay DXP for a test drive and tour its features on your own Linux, macOS, or Windows machine.

## Run Liferay locally on Linux, macOS, or Windows

Copy and paste the following commands into your Terminal (Linux, macOS) or Command Prompt (Windows).

> **Note:** JAVA JDK 8 or 11 is required to run Liferay DXP. Learn more by visiting [www.java.com](https://www.java.com/).

1. Download the Liferay Tomcat Bundle to your machine.

    ```shell
    curl -L -O https://github.com/liferay/liferay-portal/releases/download/7.2.1-ga2/liferay-ce-portal-tomcat-7.2.1-ga2-20191111141448326.tar.gz
    ```

1. Extract the Tomcat bundle .tar file in the directory you downloaded it.

    ```shell
    tar -xzf liferay-ce-portal-tomcat-7.2.1-ga2-20191111141448326.tar.gz
    ```

1. Start the server by running the following command(s) appropriate to your operating system:

    **Linux / macOS**

    ```shell
    ./liferay-ce-portal-7.2.1-ga2/tomcat-9.0.17/bin/startup.sh
    ```

    **Windows**

    ```bat
    cd liferay-ce-portal-7.2.1-ga2\tomcat-9.0.17\bin
    ```

    ```bat
    startup.bat
    ```

    > Note: Executing `startup.bat` will launch a new Tomcat server console window with a live log.

1. Verify server startup. The following message indicates server startup completion:

    ```shell
    INFO [main] org.apache.catalina.startup.Catalina.start Server startup in [x] milliseconds
    ```

1. If a browser window does not launch automatically, navigate a browser to `http://localhost:8080/`. Follow the prompts to complete Basic Configuration and get started!

    ![Follow the Setup Wizard Prompts to Log In](./getting-started-with-liferay-dxp/images/01.png)

## Next Steps

Now you're ready to explore Liferay DXP! To continue to learn more about the basics see the following articles:

* Introduction to the Admin Account
* Using the Product Menu
* Adding Your First User
* Creating Your First Site
* Changing Your Theme

To learn more about what you can build with Liferay DXP see [Building Solutions on DXP](https://github.com/liferay/liferay-learn/tree/master/docs/dxp/7.2.x/en/solutions).

To learn more about installing Liferay DXP see the [Installation Overview](./02-installation-overview.md).
