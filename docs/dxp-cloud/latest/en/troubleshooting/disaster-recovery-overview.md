# Disaster Recovery Overview

Liferay DXP Cloud offers two strategies for disaster recovery: Automatic and Cross-Region.

## Automatic Disaster Recovery Strategy

In the case of an **Automatic Disaster Recovery**, services are replicated across the availability zones in different geographic locations within the same region. _No action is required from the customer during an incident._

## Cross-Region Disaster Recovery Strategies

There are multiple Cross-Region DR strategies in the IT industry which have been classified as "cold", "warm", or "hot". These strategies indicate how prepared the system is to recover when something goes wrong. One analogy is the response if you were driving and had a flat tire. How you deal with this situation depends on how equipped you are:

| Type | Solution |
| --- | ---  |
| Cold | You have no spare tire, so you must call someone to come to you with a new tire. Your trip stops until someone comes and replaces the tire. |
| Warm | You have a spare tire and a replacement kit, so you can get back on the road using what you have in your car. However, you must stop your journey to repair the problem. |
| Hot | You have special run-flat tires. You might need to slow down a little, but there is no immediate impact on your journey. Your tires run well enough that you can continue (although you must eventually address the issue). |

In DXP Cloud, we classify our DR strategy as _Warm_.

It's not _Cold_ since you don't have to contact our support in order to solve that problem for you. It's not _Hot_ because you need human intervention to handle it. We consider it to be _Warm_ since we provide you with all the tools to realize the procedure.

## Use Case

### During an Incident

| Time | Event |
| --- | --- |
| 12:30 pm | Everything is normal with our Production environment (located in _eu-west2_ region). Users are able to access the system with no problems. |
| 1:00 pm | Our automatic backup is triggered; this generates a copy of our Database and Document Library. |
| 2:00 pm | Our automatic backup is triggered once again since we configured it to run every hour. |
| 2:34 pm | We are notified that the entire eu-west2 region has been compromised. This means we'll need to enable our DR environment, which is located in the _us-west1_ region, in order to minimize downtime. From 2:00 pm until 2:34 pm there were no backups generated, therefore we'll need to restore the 2:00 pm backup of the Production database and document library to the DR environment. In addition, we'll get the latest Build number from Production and deploy it to the DR environment, validate if the VPN has been configured properly in the DR environment, and finally change the Custom Domain to serve traffic to users. The amount of time those steps will take depends on the size of your application and how fast your team will be able to respond, but let's say it took 16 minutes. |
| 3:00 pm | Everything is back to normal and now we're serving traffic through the DR environment. |

### Post-Incident Recovery

| Time | Event |
| --- | --- |
| 4:00 pm | Liferay Cloud Team is notified that the eu-west2 region has been recovered and the incident is over, which means that we are ready to go back to our original Production environment. |
| 4:16 pm | We'll perform a manual backup since there has been new user data generated during the period we were using the DR environment. |
| 4:21 pm | We can use the manual backup we just generated to restore the Production environment and then change the Custom Domain. |

## Additional Information

* See [Implementing Disaster Recovery Procedures](./implementing-disaster-recovery-procedures.md) on how to set up your cross-region disaster recovery procedures.
