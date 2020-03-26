# Creating a Model Listeners

You can add a custom model listener by implementing the [`ModelListener`](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-kernel/src/com/liferay/portal/kernel/model/ModelListener.java) interface.

Model listeners listen for persistence method calls that signal changes to a specified model (such as `update` or `add` methods). Most of the methods model listeners use are called from DXP's [`BasePersistenceImpl`](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-kernel/src/com/liferay/portal/kernel/service/persistence/impl/BasePersistenceImpl.java) class. You can define model listeners for out-of-the-box entities (like `JournalArticle` or `AssetEntry`), or for custom entities.

Here, you'll learn how to create model listeners in three steps: 

1. Examine a Running Model Listener
2. Modify the Model Listener 
3. Deploy Your Model Listener 

<!-- The above steps are only my attempt at an example for this tutorial, and they may not be correct. Please go through and make your headings more informative for readers, with that right column on the site in mind. --> 

## Deploy an Example

Your first step is to deploy an example model listener for the `JournalArticle` model on your instance of Liferay DXP. Follow these steps:

1. Start the DXP image.

```
docker run -it -p 8080:8080 liferay/portal:7.3.0-ga1
```

1. Download and unzip `Acme Model Listener`.

```
curl https://learn.liferay.com/dxp-7.x/liferay-internals/extending-liferay/liferay-n4g6.zip -O
```

```
unzip liferay-n4g6.zip
```

1. Build and deploy the example.

```
./gradlew deploy -Ddeploy.docker.container.id=$(docker ps -lq)
```

```note::
   This command is the same as copying the deployed jars to /opt/liferay/osgi/modules on the Docker container.
```

1. Confirm the deployment in the Docker container console.

```
STARTED com.acme.n4g6.impl_1.0.0
```

1. Verify that the example model listener was added by viewing the added log message. Open your browser to `https://localhost:8080` and navigate to the Site menu → _Content & Data_ → _Web Content_.

   ![The web content administration page is your interface for creating web content.](./creating-a-model-listener/images/01.png)

   Click the add ![Add icon](../../images/icon-add.png) button, then click _Basic Web Content_ to add a new article. Fill out a title and some content; then click _Publish_. A warning message appears in the console:

   ```
   2020-03-17 23:14:56.301 WARN  [http-nio-8080-exec-5][N4G6ModelListener:23] A new web content article was added.
   ```

Congratulations, you've successfully built and deployed a new model listener that implements `ModelListener`.

Next, you can learn how model listeners work. 

## Walk Through the Example

Now you'll review the example you deployed. First, you'll annotate the class for OSGi registration. Second, you'll review the `ModelListener` interface. Finally, you'll complete an implementation of `ModelListener`.

### Annotate the Class for OSGi Registration

```java
@Component(immediate = true, service = ModelListener.class)
public class N4G6ModelListener extends BaseModelListener<JournalArticle> {
```

> Define the class to listen to events for (in this example, `JournalArticle`). When this model listener is registered, it will listen to events for the model defined. The model can be an out-of-the-box entity or a custom entity.
>
> Extending the `BaseModelListener` class gives a default, empty implementation for each of `ModelListener`'s methods. This allows you to only override the methods you need.

### Review the `ModelListener` Interface

All of the `ModelListener` interface's methods are optional to override if you extend the `BaseModelListener` class.

You can provide your own implementation for any of the following methods:

```java
public void onAfterAddAssociation(
		Object classPK, String associationClassName,
		Object associationClassPK)
	throws ModelListenerException;
```

> This method is called after an entity related to the model listener's associated entity is added. These method calls may appear in different places, depending on what models have relationships with your listener's model.

```java
public void onAfterCreate(T model) throws ModelListenerException;
```

> This method is called after a new instance of the model listener's associated entity is added. This happens in `BasePersistenceImpl`'s [update](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-kernel/src/com/liferay/portal/kernel/service/persistence/impl/BasePersistenceImpl.java#L524) method.

```java
public void onAfterRemove(T model) throws ModelListenerException;
```

> This method is called after an instance of the model listener's associated entity is removed. This happens in `BasePersistenceImpl`'s [remove](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-kernel/src/com/liferay/portal/kernel/service/persistence/impl/BasePersistenceImpl.java#L460) method.

```java
public void onAfterRemoveAssociation(
		Object classPK, String associationClassName,
		Object associationClassPK)
	throws ModelListenerException;
```

> This method is called after an entity related to the model listener's associated entity is removed. These method calls may appear in different places, depending on what models have relationships with your relationship's model.

```java
public void onAfterUpdate(T model) throws ModelListenerException;
```

> This method is called after an instance of the model listener's associated entity is updated. This happens in `BasePersistenceImpl`'s [update](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-kernel/src/com/liferay/portal/kernel/service/persistence/impl/BasePersistenceImpl.java#L524) method.

```java
public void onBeforeAddAssociation(
		Object classPK, String associationClassName,
		Object associationClassPK)
	throws ModelListenerException;
```

> This method is called before an entity related to the model listener's associated entity is added. These method calls may appear in different places, depending on what models have relationships with your listener's model.

```java
public void onBeforeCreate(T model) throws ModelListenerException;
```

> This method is called before a new instance of the model listener's associated entity is added. This happens in `BasePersistenceImpl`'s [update](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-kernel/src/com/liferay/portal/kernel/service/persistence/impl/BasePersistenceImpl.java#L524) method.

```java
public void onBeforeRemove(T model) throws ModelListenerException;
```

> This method is called before an instance of the model listener's associated entity is removed. This happens in `BasePersistenceImpl`'s [remove](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-kernel/src/com/liferay/portal/kernel/service/persistence/impl/BasePersistenceImpl.java#L460) method.

```java
public void onBeforeRemoveAssociation(
		Object classPK, String associationClassName,
		Object associationClassPK)
	throws ModelListenerException;
```

> This method is called before an entity related to the model listener's associated entity is removed. These method calls may appear in different places, depending on what models have relationships with your relationship's model.

```java
public void onBeforeUpdate(T model) throws ModelListenerException;
```

> This method is called before an instance of the model listener's associated entity is updated. This happens in `BasePersistenceImpl`'s [update](https://github.com/liferay/liferay-portal/blob/7.3.0-ga1/portal-kernel/src/com/liferay/portal/kernel/service/persistence/impl/BasePersistenceImpl.java#L524) method.

### Complete the Model Listener

The model listener needs custom logic for the events that are important to you. Override the `ModelListener` interface's methods corresponding to the events you need.

This example only needs logic after a new instance of the model listener's associated entity is created. This means the logic must be added to the `onAfterCreate` method:

```java
public void onAfterCreate(JournalArticle model)
	throws ModelListenerException {

	if (_log.isWarnEnabled()) {
		_log.warn("A new web content article was added.");
	}
}
```

## Conclusion

Congratulations! You now know the basics for implementing the `ModelListener` interface, and have added a new model listener to Liferay DXP.
