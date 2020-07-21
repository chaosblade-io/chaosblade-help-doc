# blade create network occupy

# **Introduction**
The network experiment scene in docker container is the same as the network scene of basic resources
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


