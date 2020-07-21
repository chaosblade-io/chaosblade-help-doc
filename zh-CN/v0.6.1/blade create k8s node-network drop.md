# blade create network drop

# **Introduction**
The kubernetes Node network scenario is the same as the network scenario of the underlying resource
# **Flags**

```
--local-port
	Port for local service
--remote-port
	Port for remote service
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

In the experimental scenario of network shielding, 100% packet loss on the same network will be followed by 100% replacement of packet loss. The difference between the two is that the underlying implementation mechanism is different, and the network mask only supports ports, not the entire network card, which has limitations. It is recommended to replace this command with network packet loss 100%
````
# Experimental scenario of network shielding
blade create network drop
````

