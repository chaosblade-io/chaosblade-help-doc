# blade create network occupy

# **Introduction**
Kubernetes pod network scenarios, the same as the network scenario of basic resources
# **Flags**

```
--port
	The port occupied
--force
	Force kill the process which is using the port
--evict-count
	Count of affected resource
--evict-percent
	Percent of affected resource, integer value without %
--names
	Resource names, such as pod name. You must add namespace flag for it. Multiple parameters are separated directly by commas
--namespace
	Namespace, such as default, only one value can be specified
--labels
	Label selector, the relationship between values that are or
--evict-group
	Group key from labels
--timeout
	set timeout for experiment

```

# **Example**

````
# Specify port 8080 occupancy
blade c network occupy --port 8080 --force
````
````
# The machine accesses external 14.215.177.39 machine (ping www.baidu.com) 80 port packet loss rate 100%
blade create network loss --percent 100 --interface eth0 --remote-port 80 --destination-ip 14.215.177.39
````


