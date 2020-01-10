# Command-line Tool

Liferay DXP's command-line interface (CLI) is a tool that helps you use and manage DXP Cloud services. The CLI can be used to create, manage, and scale applications. See the following actions:

* [Installing the CLI](#installing-the-cli)
* [Upgrading the CLI from v2 to v3](#uninstalling-version-2x)
* [Changing the CLI Remote](#changing-the-cli-remote)
* [Showing the Service Logs](#showing-the-service-logs)
* [Changing the Number of Service Instances](#changing-the-number-of-service-instances)
* [Listing Projects or Services](#listing-projects-or-services)
* [Restarting a Service](#restarting-a-service)
* [Accessing a Service's Shell](#accessing-a-services-shell)
* [Uninstalling the CLI](#uninstalling-the-cli)

## Installing the CLI

### \*nix Systems

Open a terminal and run this command:

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/install.sh -fsSL | bash
```

If you get a permissions error, try running the same command with `sudo`.

### Windows Systems

Download the latest version of the [Windows installer](https://cdn.liferay.cloud/lcp/stable/latest/lcp-install.exe) and follow the steps in the wizard.

## Upgrading the CLI from v2 to v3

The latest version of Command-Line Interface tool is version 3. Because of technical limitations, the CLI tool cannot be updated using the command `lcp update`. Legacy versions must be uninstalled first before the version 3 can be used. This prevent conflicts with the same binary name.

**Important note**: The following instructions differ from those found in the [Uninstalling the CLI](#uninstalling-the-cli) section for the \*Nix and Windows environments.

### MacOS or Linux

1. Open a terminal and run: `lcp uninstall`.
1. Verify uninstall is complete by running the command `lcp`.

### Windows

For Windows 7 and 8, navigate to `Control Panel > Add or Remove Programs`. In Windows 10, navigate to `Control Panel` > `Programs` > `Uninstall a program`.

1. Go to Control Panel > Programs > Uninstall a program
1. Select `lcp amd64-installer-0.3`
1. Click _Uninstall_ then confirm.
1. Verify uninstall is complete by running the command `lcp` or `lcp.exe`.

Verify that CLI version 2 has been uninstalled before installing version 3.

## Changing the CLI Remote

To access DXP Cloud services via the CLI, the CLI must be pointed to the right DXP Cloud. The remote URL for DXP Cloud is `liferay.cloud`. To list the CLI's remotes, run this command:

```shell
lcp remote
```

Follow these steps to change the default remote:

1. Add a new remote if necessary:

    ```shell
    lcp remote set <remote-alias> <remote-url>
    ```

1. Run this command to set the default remote:

    ```shell
    lcp remote default <remote-alias>
    ```

Alternatively, specify the remote inline via this command:

```shell
lcp shell --project <project-id> --service <service-id> --remote <remote-alias>
```

## Showing the Service Logs

The `lcp log` command displays the DXP Cloud project's service logs. Here are some common examples.

Check an entire project's logs:

```shell
lcp log --project <projectID>
```

View the logs of a specific service in a project:

```shell
lcp log --project <projectID> --service <serviceID>
```

View the logs of a specific period of time:

```shell
lcp log --project <projectID> --since <timestamp>
```

Alternatively, view a service's logs by passing the service's full URL to
`lcp log`:

```shell
lcp log --url <serviceID>-<projectID>.lfr.cloud
```

## Changing the Number of Service Instances

Use the `lcp scale` command to change the number of instances. Here are some common examples.

```shell
lcp scale --project <projectID> <instances>
```

Scale instances of a specific service in a project:

```shell
lcp scale --project <projectID> --service <serviceID> <instances>
```

Alternatively, scale instances by passing its full URL to `lcp restart`:

```shell
lcp scale --url <serviceID>-<projectID>.lfr.cloud <instances>
```

## Listing Projects or Services

Use the `lcp list` command to list projects and services. Here are some common
examples.

See the full list of projects, services, and instances you own or collaborate on:

```shell
lcp list
```

List a project's services:

```shell
lcp list --project <projectID>
```

Check a specific service in a project:

```shell
lcp list --project <projectID> --service <serviceID>
```

Alternatively, check a service by passing its full URL to `lcp list`:

```shell
lcp list --url <serviceID>-<projectID>.lfr.cloud
```

## Restarting a Service

Use the `lcp restart` command to restart a service. Here are some common
examples.

Restart a project's services:

```shell
lcp restart --project <projectID>
```

Restart a specific service in a project:

```shell
lcp restart --project <projectID> --service <serviceID>
```

Alternatively, restart a service by passing its full URL to `lcp restart`:

```shell
lcp restart --url <serviceID>-<projectID>.lfr.cloud
```

## Accessing a Service's Shell

To access a service container's shell, run this command:

```shell
lcp shell
```

This lists all the services in the container and lets administrators choose
which one to access.

Alternatively, access the shell of a specific service's container by adding the
service's project ID and service ID to the `lcp shell` command:

```shell
lcp shell --project <projectID> --service <serviceID>
```

## Open docs

Use the CLI to open DXP Cloud documentation anytime.

```shell
lcp docs
```

## Uninstalling the CLI

For Mac and Linux, run this command:

```bash
curl https://cdn.liferay.cloud/lcp/stable/latest/uninstall.sh -fsSL | bash
```

For Windows 7 and 8, navigate to `Control Panel > Add or Remove Programs`. In Windows 10, navigate to `Control Panel` > `Programs` > `Uninstall a program`. Find "LCP CLI" in the list of programs, select it, and click "Uninstall". Follow the steps in the wizard.
