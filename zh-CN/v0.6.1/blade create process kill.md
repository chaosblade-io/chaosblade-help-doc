# blade create process kill

# **Introduction**
Kill process by process id or process name
# **Flags**

```
--process
	Process name
--process-cmd
	Process name in command
--count
	Limit count, 0 means unlimited
--local-port
	Local service ports. Separate multiple ports with commas (,) or connector representing ranges, for example: 80,8000-8080
--signal
	Killing process signal, such as 9,15
--exclude-process
	Exclude process
--timeout
	set timeout for experiment

```

# **Example**

````
# Kill the process that contains the `SimpleHTTPServer` keyword
blade create process kill --process SimpleHTTPServer
````
````
# Kill the Java process
blade create process kill --process-cmd java
````
````
# Specifies the semaphore and local port to kill the process
blade c process kill --local-port 8080 --signal 15
````


