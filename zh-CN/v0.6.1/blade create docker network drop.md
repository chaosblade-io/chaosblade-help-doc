# blade create network drop

# **Introduction**
The network experiment scene in docker container is the same as the network scene of basic resources
# **Flags**

```
--local-port
	Port for local service
--remote-port
	Port for remote service
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

In the experimental scenario of network shielding, 100% packet loss on the same network will be followed by 100% replacement of packet loss. The difference between the two is that the underlying implementation mechanism is different, and the network mask only supports ports, not the entire network card, which has limitations. It is recommended to replace this command with network packet loss 100%
````
# Experimental scenario of network shielding
blade create network drop
````


