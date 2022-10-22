# IDEA

## Settings

### VM properties

```properties
# Memory settings
-Xms512m
-Xmx4g
-XX:ReservedCodeCacheSize=512m
```

### Custom properties

```properties
# custom IntelliJ IDEA properties
idea.max.intellisense.filesize=10000
idea.config.path=~/.config/idea-2020.3/config
idea.system.path=~/.config/idea-2020.3/system
idea.plugins.path=~/.config/idea-2020.3/plugins
idea.log.path=~/.config/idea-2020.3/logs
```

### Plugins

* Rainbow Brackets
* Key Promoter X
* GitLink
* GitToolBox

> To access preview versions of plugins add plugin repository:
> https://plugins.jetbrains.com/plugins/list?channel=beta

## Structural search

### Instance method

```xml
<searchConfiguration name="InstanceMethod" text="$MyClass$.methodName()" type="JAVA">
<constraint name="MyClass" nameOfExprType="MyClass" />
</searchConfiguration>
```

## Hotkeys

* Instead of Find (Command + F) use file structure (Command + F12)
* Instead of Find Usages (Option + F7) use Call Hierarchy (Control + Option + H)