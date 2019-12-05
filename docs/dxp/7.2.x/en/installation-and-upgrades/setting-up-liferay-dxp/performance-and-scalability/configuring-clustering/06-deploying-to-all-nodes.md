# Deploying to All Nodes

All modules and WAR files you deploy onto the cluster must be deployed to all cluster nodes. Because Liferay DXP [installs applications as OSGi bundles](https://help.liferay.com/hc/en-us/articles/360028710332-Deploying-WARs-WAB-Generator-), you cannot rely on your application server's means of installing WAR files to deploy an application to the entire cluster (even if you only intend to install WAR files). Instead, place the application in each node's auto deploy folder (e.g., `[Liferay Home]/deploy`). 

Best practice is to accomplish this with a script. Write a shell script that uploads applications to each node using sftp or some other service. This way, when you deploy an application, it uploads to each node's auto deploy folder and installs to DXP on each node.
