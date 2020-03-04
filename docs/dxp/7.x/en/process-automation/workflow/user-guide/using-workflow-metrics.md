# Using Workflow Metrics

> Subscription

_Workflow Metrics_ gives insight into the time spent to complete certain workflow events. To use it, set up deadlines on a workflow process's events. These deadline configurations are referred to as SLAs (Service Level Agreements). Once defined, Workflow Reports measure compliance with the SLAs. They're like a contract between the workflow participants and Users submitting workflow items. _Workflow Reports_ shows data for all processes with SLAs, including each workflow item's SLA status: on time or overdue.

```important::
   * *Editing a Workflow with SLAs:* Editing a workflow (e.g., removing nodes, editing a task name) with SLAs defined on it may invalidate the SLA for items already in the workflow/SLA pipeline.

   * *Creating or Editing SLAs for Active Processes:* Editing an SLA's duration or defining a new SLA while items are already in the workflow process causes a recalculation for all instances currently in the workflow. Completed workflow instances are not recalculated.
```

## Prerequisites

To use _Workflow Metrics_, you must be using Elasticsearch to index your DXP data. To learn more, read the [Installing Elasticsearch](https://help.liferay.com/hc/en-us/articles/360028711132-Installing-Elasticsearch) article.

## Adding SLAs

1. Navigate to the _Control Panel_ &rarr; _Workflow_ &rarr; _Metrics_.
1. Click on the title of the Process.
1. If there's no SLA for the process, a warning message stating as much appears. Click the _Add a new SLA_ link from the warning to access the New SLA form directly.

    Alternatively, click the Options (![Options](../../../images/icon-options.png)) menu and select _SLA Settings_.

    ![Add SLAs to a workflow definition from the Metrics application.](./using-workflow-metrics/images/01.png)

1. On the SLAs screen, click the _Add_ button (![Add](../../../images/icon-add.png)).
1. In the New SLA form, give the SLA a Name and Description.
1. Define the time frame for the SLA, specifying three things:

    * **Start**: Enters Task: Review
    * **Pause**: On Task: Update
    * **Stop**: Process Ends: Approved

1. Define the duration (i.e., the deadline) for the SLA. Fill out at least one of the two time boxes.

    * **Days:** 1
    * **Hours:** 00:00

    ![SLA example](./using-workflow-metrics/images/03.png)

1. Click _Save_.

![Figure 2: Manage SLAs from the SLAs screen.](./using-workflow-metrics/images/02.png)

### Valid Start and Stop Events

Any workflow task can be used as a start or end parameter for the SLA.

When the item makes it to the event defined here, the SLA timer begins counting. Choose between the following:

| Event | Description |
| --- | --- |
| Process Begins | This corresponds to the start node. |
| Enters Task: Review | The SLA clock begins when a person begins reviewing the asset. |
| Enters Task: Update | The SLA clock begins when a person has updated the asset. |
| Leaves Task: Review | The SLA clock begins when a person stops the review process. |
| Leaves Task: Update | The SLA clock begins when a person leaves the task.  |

If the item makes it to the Stop event before the defined SLA duration (the deadline), it's _On Time_ according to the SLA. If it fails to make it to the Stop event in the specified duration, it's _Overdue_. When defining the tasks to act as the SLA's Stop Events, choose between the following:

| Event | Description |
| --- | --- |
| Enters Task: Review | The SLA clock stops when a person begins reviewing the asset. |
| Enters Task: Update | The SLA clock stops when a person has updated the asset. |
| Leaves Task: Review | The SLA clock stops when a person left the review process. |
| Leaves Task: Update | The SLA clock stops when a person leaves a task. |
| Process Ends: Approved | This corresponds to the end node. |

The Pause field is if there's an event in the workflow when time should stop counting. For the Single Approver workflow, you might choose to pause the SLA timer when the item is in the Update task. The SLA can be paused at any task that falls between the start node and the end node, and it is defined by setting the node(s) when the SLA should be paused. _The SLA timer is paused the entire time a workflow item is in the specified node_.

### Durations

| Unit of Time | Instruction |
| --- | --- |
| Days | Enter a whole number for number of days. If there are partial days such as 36 hours, use in combination with the _Hours_ field; express it 1 Day and 12 Hours. |
| Hours | Enter the number of hours and minutes. The values in the _Hours_ box must not exceed _23:59_; if the duration exceeds one day, use in combination with the _Days_ field. |

## Additional Information

* [Creating Tasks in the Workflow Designer](https://help.liferay.com/hc/articles/360028821932-Creating-Tasks-in-the-Workflow-Designer)
* [Workflow Task Nodes](https://help.liferay.com/hc/articles/360028834732-Workflow-Task-Nodes)
