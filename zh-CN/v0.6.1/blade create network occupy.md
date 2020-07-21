# blade create network occupy

# **Introduction**
Occupy the specify port, if the port is used, it will return fail, except add --force flag
# **Flags**

```
--port
	The port occupied
--force
	Force kill the process which is using the port
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


