# blade create jvm cpufullload

# **Introduction**
Process occupied cpu full load
# **Flags**

```
--cpu-count
	Binding cpu core count
--process
	Application process name
--pid
	The process id

```

# **Example**

````
# Specifies full load of all kernel
blade c jvm cfl --process tomcat
````
````
# Specifies full load of two kernel
blade c jvm cfl --cpu-count 2 --process tomcat
````


