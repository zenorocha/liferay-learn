# Migrating From Audience Targeting

Liferay DXP 7.2 integrates all the Audience Targeting app's features into Liferay's core as Segmentation and Personalization. This enables better integration with other applications and provides developers with easier access to Segmentation and Personalization features. Audience Targeting users must migrate their user segments into the new Segments application. There are three steps to the migration process:

1.  Upgrade to DXP 7.2

2.  Migrate custom rules.

3.  Migrate behavior-based features.

First, to upgrade to the latest version of @product@, follow the [upgrade guide](../01-introduction-to-upgrading-to-liferay-dxp-7-2.md). Most of your Audience Targeting configuration is automatically transferred into the new engine.

Next, any custom rules that were created in Audience Targeting must be re-evaluated. Some custom rules may have an out-of-the-box equivalent now, while others must be migrated. If a rule must be re-implemented, follow the [Segmentation and Personalization development guide](/docs/7-2/frameworks/-/knowledge_base/f/segmentation-personalization). You can check [the list of rules that are automatically migrated](./02-migrating-user-segments.md) to see how much additional work will be needed. You must also [migrate display widgets](/docs/7-2/deploy/-/knowledge_base/d/manually-migrating-from-audience-targeting) since the new Personalization features use different tools.

Finally, you must migrate behavior-based features, but since Audience Targeting's analytics features are now part of Analytics Cloud, there isn't a direct path to upgrade. See the [Analytics Cloud documentation](https://help.liferay.com/hc/en-us/articles/360006947671-Creating-Segments).
