# blade create network dns

# **Introduction**
The network experiment scene in docker container is the same as the network scene of basic resources
# **Flags**

```
--domain
	Domain name
--ip
	Domain ip
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
# The domain name www.baidu.com is not accessible
blade create network dns --domain www.baidu.com --ip 10.0.0.0
````


