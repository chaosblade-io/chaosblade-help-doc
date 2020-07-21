# blade create process kill

# **Introduction**
Kubernetes Container process scenes, same as the process scenes of the underlying resources
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
--container-id
	Container id
--image-repo
	Image repository of the chaosblade-tool
--image-version
	Image version of the chaosblade-tool
--docker-endpoint
	Docker socket endpoint
--blade-tar-file
	The pull path of the ChaosBlade tar package, for example, --blade-tar-file /opt/chaosblade-0.4.0.tar.gz
--blade-override
	Override the exists chaosblade tool in the target container or not, default value is false
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
# Kill the nginx process in the container
blade create docker process kill --process nginx --blade-tar-file /root/chaosblade-0.4.0.tar.gz --container-id ee54f1e61c08
````


