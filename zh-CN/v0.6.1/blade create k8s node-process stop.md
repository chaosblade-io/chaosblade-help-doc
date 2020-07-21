# blade create process stop

# **Introduction**
The kubernetes Node process scenario is the same as the process scenario of the underlying resource
# **Flags**

```
--process
	Process name
--process-cmd
	Process name in command
--evict-count
	Count of affected resource
--evict-percent
	Percent of affected resource, integer value without %
--names
	Resource names, such as pod name. You must add namespace flag for it. Multiple parameters are separated directly by commas
--labels
	Label selector, the relationship between values that are or
--timeout
	set timeout for experiment

```

# **Example**

````
# Pause the process that contains the `SimpleHTTPServer` keyword
blade create process stop --process SimpleHTTPServer
````
````
# Pause the Java process
blade create process stop --process-cmd java
````


