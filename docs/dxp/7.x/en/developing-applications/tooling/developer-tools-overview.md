# Developer Tools Overview

Liferay's developer tools run the gamut from lightweight CLI utilities all the way to a full-blown IDE based on Eclipse. This is to serve all developers, whether you're just starting out or have been writing code for many years. All of Liferay's development tools work on Linux, Mac, and Windows platforms.
<!-- JR: the mental image I have from all these tools (initially) is a variety of jigsaw puzzle pieces that I don't (yet) see how they piece together. Perhaps by presenting them with more structure, it can help guide a reader to build a better mental model for how all these tools relate to (and don't duplicate) one another. In some ideal world we have a nice diagram that visualizes how these tools relate to one another. One off the cuff organizational model:

# Title

(intro paragraph)

## General Development Tools

### Blade CLI

Blade CLi is x. Use it to do a, b, and c quickly and efficiently.

### Liferay Workspace

## Frontend Tooling

### Theme Generator

### JS Generator

## IDE Plugins

### IntelliJ Plugin

### Dev Studio
-->
[Blade CLI](./blade-cli/installing-and-updating-blade-cli.md) makes it easy to create and build both standalone projects and Liferay Workspaces from your command line interface.

**Liferay Workspace** is an environment in your file system that holds your projects and their configurations. You can deploy to Liferay DXP, create and store Docker configurations, and perform all your DevOps from this single environment.

**Liferay Theme Generator** helps front-end developers create themes and layout templates to define the look and feel of your Liferay DXP-based site.

**Liferay JS Generator** creates projects for JavaScript-based widgets deployable to Liferay DXP.

**Liferay IntelliJ Plugin** provides support for using Liferay Workspaces and standalone projects in IntelliJ IDEA.

**Liferay Developer Studio** is an Eclipse-based IDE that supports the full scope of Liferay development.

Under the hood, Liferay Workspace is powered by a multitude of Gradle and Maven plugins you can apply to your projects. There are also project templates and samples to get you started.

The sample projects provided with the developer documentation are small, standalone projects, intentionally simplified to help you learn Liferay DXP's features and APIs. When you're ready to create your own projects, experienced developers should install Blade CLI to create a Liferay Workspace, IntelliJ users should install the IntelliJ plugin, and everyone else should install Liferay Developer Studio.

We hope you'll enjoy using Liferay's development tools with your Liferay projects!
