# blade create process stop

# **Introduction**
process fake death by process id or process name
# **Flags**

```
--process
	Process name
--process-cmd
	Process name in command
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


