# blade create disk fill

# **Introduction**
Fill the specified directory path. If the path is not directory or does not exist, an error message will be returned.
# **Flags**

```
--path
	The path of directory where the disk is populated, default value is /
--size
	Disk fill size, unit is MB. The value is a positive integer without unit, for example, --size 1024
--percent
	Total percentage of disk occupied by the specified path. If size and the flag exist, use this flag first. The value must be positive integer without %
--reserve
	Disk reserve size, unit is MB. The value is a positive integer without unit. If size, percent and reserve flags exist, the priority is as follows: percent > reserve > size
--retain-handle
	Whether to retain the big file handle, default value is false.
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
# Perform a disk fill of 40G to achieve a full disk (34G available)
blade create disk fill --path /home --size 40000
````
````
# Performs populating the disk by percentage, and retains the file handle that populates the disk
blade c disk fill --path /home --percent 80 --retain-handle
````
````
# Perform a fixed-size experimental scenario
blade c disk fill --path /home --reserve 1024
````


