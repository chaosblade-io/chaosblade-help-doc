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


