# blade create network reorder

# **Introduction**
Reorder experiment
# **Flags**

```
--local-port
	Ports for local service. Support for configuring multiple ports, separated by commas or connector representing ranges, for example: 80,8000-8080
--remote-port
	Ports for remote service. Support for configuring multiple ports, separated by commas or connector representing ranges, for example: 80,8000-8080
--exclude-port
	Exclude local ports. Support for configuring multiple ports, separated by commas or connector representing ranges, for example: 22,8000. This flag is invalid when --local-port or --remote-port is specified
--destination-ip
	destination ip. Support for using mask to specify the ip range such as 92.168.1.0/24 or comma separated multiple ips, for example 10.0.0.1,11.0.0.1.
--ignore-peer-port
	ignore excluding all ports communicating with this port, generally used when the ss command does not exist
--interface
	Network interface, for example, eth0
--exclude-ip
	Exclude ips. Support for using mask to specify the ip range such as 92.168.1.0/24 or comma separated multiple ips, for example 10.0.0.1,11.0.0.1
--force
	Forcibly overwrites the original rules
--percent
	Packets are sent immediately percentage, must be positive integer without %, for example, --percent 50
--correlation
	Correlation on previous packet, value is between 0 and 100
--gap
	Packet gap, must be positive integer
--time
	Delay time, must be positive integer, unit is millisecond, default value is 10
--timeout
	set timeout for experiment

```

# **Example**

````
# Access the specified IP request packet disorder
blade c network reorder --correlation 80 --percent 50 --gap 2 --time 500 --interface eth0 --destination-ip 180.101.49.12
````


