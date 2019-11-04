# Self-Healing

The self-healing functionality of DXP Cloud detects if a service or application has become unresponsive and automatically initiates procedures to recover the unresponsive service. The platform uses probes to monitor the services.

## Using and Configuring Probes

DXP Cloud offers two probes used in conjunction to manage applications:

* Liveness Probe: Indicates whether the service is running.
* Readiness Probe: Indicates whether the service is ready to receive requests.

Each probe can be configured with the following options:

| Property Name | Description |
| --- | --- |
| `initialDelaySeconds`| Number of seconds after the container has started before the probe is initiated. |
| `periodSeconds` | How often (in seconds) to perform the probe. The default is 10; the minimum is 1. |
| `timeoutSeconds` | Number of seconds after which the probe times out. The default and minimum is 1. |
| `successThreshold` | Minimum consecutive successes for the probe to be considered successful following a failure. The default and minimum is `1`. Must be `1` for liveness. |
| `failureThreshold` | The number of times DXP Cloud repeats a failed probe before giving up. For a liveness probe, giving up means the service will restart. For a readiness probe, giving up means the probe will be marked as Failed. The default is `3`; the minimum is `1`. |

When a probe detects a failure (not returning the success message in a status check), the probe will restart the service automatically. The liveness and readiness probes are deployed to all services regardless of the environment. Typically, customers do not have to make any changes to the probes unless they would like to adjust their values based on their needs. For example, a system administrator may increase the `initialDelaySeconds` value to account for a longer startup process.

To change the default values, modify the `lcp.json` file. See the [Configuration via LCP.json](../reference/configuration-via-lcp-json.md) article.

### Liveness Probe

The liveness probe uses a URL Request (path/port) to validate that a service is running. Often, it is a lightweight HTTP server inside the application to respond to the liveness probe. The probe pings a path and if it gets an HTTP response in the 200 or 300 range, it marks the application as healthy.

Each service's `LCP.json` file contains the following:

```json
{
  "livenessProbe": {
    "httpGet": {
      "path": "/status",
      "port": 3000
    },
    "initialDelaySeconds": 40,
    "periodSeconds": 5,
    "successThreshold": 5
  }
}
```

### Readiness Probe

The readiness probe uses an executable command. If the command returns with the correct exit code, then the container is marked as healthy. Otherwise, it is marked unhealthy.

Each service's `LCP.json` file contains the following:

```json
{
  "readinessProbe": {
    "exec": {
      "command": ["cat", "/tmp/healthy"]
    },
    "initialDelaySeconds": 40,
    "periodSeconds": 5
  }
}
```

Here is a sample log from the readiness probe has been deployed on the `webserver` service. The log shows the Google server hitting the specific path `nginx_status` continuously.

```shell
Oct 04 12:05:51.821 build-14 [webserver-5547c96447-hbrr6] 10.138.0.69 - - [04/Oct/2019:19:05:51 +0000] "GET /nginx_status HTTP/1.1" 200 117 "-" "kube-probe/1.12+" "-"
Oct 04 12:05:53.001 build-14 [webserver-5547c96447-hbrr6] 10.138.15.249 - - [04/Oct/2019:19:05:53 +0000] "GET /nginx_status HTTP/1.1" 200 115 "-" "GoogleHC/1.0" "-"
Oct 04 12:05:53.083 build-14 [webserver-5547c96447-hbrr6] 10.138.0.13 - - [04/Oct/2019:19:05:53 +0000] "GET /nginx_status HTTP/1.1" 200 115 "-" "GoogleHC/1.0" "-"
Oct 04 12:05:53.293 build-14 [webserver-5547c96447-hbrr6] 10.138.15.251 - - [04/Oct/2019:19:05:53 +0000] "GET /nginx_status HTTP/1.1" 200 115 "-" "GoogleHC/1.0" "-"
```
