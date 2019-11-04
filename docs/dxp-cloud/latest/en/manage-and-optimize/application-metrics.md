# Application Metrics

With DXP Cloud's built-in monitoring, administrators can track the following information about all services:

* CPU usage
* Memory usage
* Transfer data

To view the application metrics, while logged into the DXP Cloud Management Console:

1. Click *Monitoring* tab.
1. Data is displayed for the past 30 days. To change the time period, click the time selector dropdown menu.

![Figure 1: You can use DXP Cloud to monitor your services.](./application-metrics/images/01.png)

## Advanced Application Metrics On Production

Before using the Dynatrace advanced monitoring features, the following requirements have to be met first:

* A Dynatrace account has been created.
* The Dynatrace secret `token` and `tenant` values have been generated.
* Dynatrace environment variables have been added to the `LCP.json` file in the DXP Service's production environment. For example:

```json
{
	"environments": {
	  "prd": {
	    "env": {
	      "LCP_PROJECT_MONITOR_DYNATRACE_TENANT": "tot02934",
	      "LCP_PROJECT_MONITOR_DYNATRACE_TOKEN": "dDKSowkdID8dKDkCkepW"
	    }
	  }
	}
}
```

| Name | Description |
| --- | --- |
`LCP_PROJECT_MONITOR_DYNATRACE_TENANT` | A string with eight characters. It is part of the URL (prefix) of your Dynatrace SaaS account. |
`LCP_PROJECT_MONITOR_DYNATRACE_TOKEN` | A string with 22 characters that you can find in your Dynatrace account at *Deploy Dynatrace* &rarr; *Start installation* &rarr; *Set up PaaS monitoring* &rarr; *Installer Download*. |

Once those required steps have been completed:

1. Navigate to <https://console.liferay.cloud/projects>.
1. Click on the production environment.
1. Click _Monitoring_ on the left menu.
1. Click the *Advanced* tab.
1. Click the _Go to Dynatrace Dashboard_ to access your [Dynatrace](https://www.dynatrace.com/) dashboard.

![Dynatrace dashboard](./application-metrics/images/02.png)

Sign in with Dynatrace credentials to check log trails and create custom dashboards.

## Additional Information

* [Advanced Monitoring: APM Tools - Dynatrace](https://help.liferay.com/hc/en-us/articles/360017896452-Advanced-Monitoring-APM-Tools-Dynatrace)
