# blade create disk burn

# **Introduction**
The kubernetes Node disk scenario is the same as the disk scenario of the underlying resource
# **Flags**

```
--read
	Burn io by read, it will create a 600M for reading and delete it when destroy it
--write
	Burn io by write, it will create a file by value of the size flag, for example the size default value is 10, then it will create a 10M*100=1000M file for writing, and delete it when destroy
--size
	Block size, MB, default is 10
--path
	The path of directory where the disk is burning, default value is /
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
# Observe the disk IO read/write load before performing the experiment
iostat -x -t 2
````
````
# The data of rkB/s, wkB/s and % Util were mainly observed. Perform disk read IO high-load scenarios
blade create disk burn --read --path /home
````
````
# Perform disk write IO high-load scenarios
blade create disk burn --write --path /home
````
````
# Read and write IO load scenarios are performed at the same time. Path is not specified. The default is /
blade create disk burn --read --write
````


