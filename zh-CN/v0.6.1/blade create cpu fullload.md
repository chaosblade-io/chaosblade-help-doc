# blade create cpu fullload

# **Introduction**
Create chaos engineering experiments with CPU load
# **Flags**

```
--cpu-count
	Cpu count
--cpu-list
	CPUs in which to allow burning (0-3 or 1,3)
--cpu-percent
	percent of burn CPU (0-100)
--timeout
	set timeout for experiment

```

# **Example**

````
# Create a CPU full load experiment
blade create cpu load
````
````
# Specifies that the kernel is full load with index 0, 3, and that the kernel's index starts at 0
blade create cpu load --cpu-list 0,3
````
````
# Specify the kernel full load of indexes 1-3
blade create cpu load --cpu-list 1-3
````
````
# Specified percentage load
blade create cpu load --cpu-percent 60
````


