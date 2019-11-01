# Log Management

Logs are crucial for debugging. On DXP Cloud, you can access your environment's 
logs via the web console or terminal. You can also download log files. 

## Accessing Logs from the Web Console

The easiest way to access an environment's logs is via the web console. To do 
so, select the environment and click the *Logs* tab in the left menu. To access 
a specific service's logs, select the service from the *All Services* menu in 
the toolbar. To download the logs, click *Download Logs*. 

![Figure 1: The web console also lets you view your logs.](./log-management/images/01.png)

## Accessing Logs from the Terminal

> **Note:** To access logs via the terminal, you must be an administrator or developer. 

Run this command to access logs from your terminal: 

```shell
lcp log
```

The `lcp log` command lists logs for all services. You can then choose which 
log(s) to access. To access logs from a specific environment, you can enter its 
ID or run the `lcp log` command with that ID: 

```shell
lcp log -p <environment-id>
```

You can also specify the service as part of the command: 

```shell
lcp log -p <environment-id> -s <service-id>
```
