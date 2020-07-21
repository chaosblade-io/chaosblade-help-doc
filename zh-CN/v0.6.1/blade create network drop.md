# blade create network drop

# **Introduction**
Drop network data
# **Flags**

```
--local-port
	Port for local service
--remote-port
	Port for remote service
--timeout
	set timeout for experiment

```

# **Example**

In the experimental scenario of network shielding, 100% packet loss on the same network will be followed by 100% replacement of packet loss. The difference between the two is that the underlying implementation mechanism is different, and the network mask only supports ports, not the entire network card, which has limitations. It is recommended to replace this command with network packet loss 100%
````
# Experimental scenario of network shielding
blade create network drop
````


