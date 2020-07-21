# blade create network delay

# **Introduction**
Delay experiment
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
--time
	Delay time, ms
--offset
	Delay offset time, ms
--timeout
	set timeout for experiment

```

# **Example**

````
# Access to native 8080 and 8081 ports is delayed by 3 seconds, and the delay time fluctuates by 1 second
blade create network delay --time 3000 --offset 1000 --interface eth0 --local-port 8080,8081
````
````
# Local access to external 14.215.177.39 machine (ping www.baidu.com obtained IP) port 80 delay of 3 seconds
blade create network delay --time 3000 --interface eth0 --remote-port 80 --destination-ip 14.215.177.39
````
````
# Do a 5 second delay for the entire network card eth0, excluding ports 22 and 8000 to 8080
blade create network delay --time 5000 --interface eth0 --exclude-port 22,8000-8080
````


