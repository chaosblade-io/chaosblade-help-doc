# blade create network occupy

# **Introduction**
Kubernetes Container network scenes, same as the network scenes of the underlying resources
# **Flags**

```
--port
	The port occupied
--force
	Force kill the process which is using the port
--container-id
	Container id
--image-repo
	Image repository of the chaosblade-tool
--image-version
	Image version of the chaosblade-tool
--docker-endpoint
	Docker socket endpoint
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
--container-ids
	Container ids
--container-names
	Container names
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


