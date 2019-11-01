# Support Access

Support Access is an optional setting that expedites troubleshooting by giving 
Liferay engineers direct access to a DXP Cloud project. DXP Cloud administrators 
can enable and disable Support Access per environment. For example, an 
administrator can enable Support Access on the development environment but 
disable it on the production environment. 

> **Note:** Support access is enabled by default in each environment. 

When Support Access is enabled, Liferay Support engineers have read access 
to the following information: 

* Project console
* Service logs
* Control Panel settings
* The region where the DXP Cloud services are hosted
* Team members and their associated roles
* Members' activities

> **Note:** Only the project administrator can configure Support Access. Support 
> Access **does not** allow Liferay Support engineers to deploy assets or 
> perform write actions in your project. 

## Changing the Support Access Setting

Support access is enabled by default in each environment, but administrators can 
disable it at any time. 

Follow these steps to change the support access setting: 

1. Navigate to *Settings* &rarr; *Support access*. 
1. Set the toggle switch to your desired setting (*Enabled* or *Disabled*). 

![Figure 1: Administrators can enable or disable support access.](./support-access/images/01.png)

## Monitoring Changes to Support Access

Any change to support access registers a new activity that lists who made that 
change and when. These activities appear in *Activities* &rarr; *General*. DXP 
Cloud also sends an email to all team members when the Support Access setting 
changes. 

![Figure 2: The general activities panel shows any changes to support access.](./support-access/images/02.png)

![Figure 3: An email lets everyone know when the Support Access setting changes.](./support-access/images/03.png)
