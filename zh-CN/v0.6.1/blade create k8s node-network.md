# blade create network

# **Introduction**
Network experiment
* [blade create k8s node-network delay](blade create k8s node-network delay.md)	Delay experiment
* [blade create k8s node-network drop](blade create k8s node-network drop.md)	Drop experiment
* [blade create k8s node-network dns](blade create k8s node-network dns.md)	Dns experiment
* [blade create k8s node-network loss](blade create k8s node-network loss.md)	Loss network package
* [blade create k8s node-network duplicate](blade create k8s node-network duplicate.md)	Duplicate experiment
* [blade create k8s node-network corrupt](blade create k8s node-network corrupt.md)	Corrupt experiment
* [blade create k8s node-network reorder](blade create k8s node-network reorder.md)	Reorder experiment
* [blade create k8s node-network occupy](blade create k8s node-network occupy.md)	Occupy the specify port


# **Example**
````
  # Access to native 8080 and 8081 ports is delayed by 3 seconds, and the delay time fluctuates by 1 second
  blade create network delay --time 3000 --offset 1000 --interface eth0 --local-port 8080,8081

  # Local access to external 14.215.177.39 machine (ping www.baidu.com obtained IP) port 80 delay of 3 seconds
  blade create network delay --time 3000 --interface eth0 --remote-port 80 --destination-ip 14.215.177.39

  # Do a 5 second delay for the entire network card eth0, excluding ports 22 and 8000 to 8080
  blade create network delay --time 5000 --interface eth0 --exclude-port 22,8000-8080

  # Experimental scenario of network shielding
  blade create network drop

  # The domain name www.baidu.com is not accessible
  blade create network dns --domain www.baidu.com --ip 10.0.0.0

  # Access to native 8080 and 8081 ports lost 70% of packets
  blade create network loss --percent 70 --interface eth0 --local-port 8080,8081

  # The machine accesses external 14.215.177.39 machine (ping www.baidu.com) 80 port packet loss rate 100%
  blade create network loss --percent 100 --interface eth0 --remote-port 80 --destination-ip 14.215.177.39

  # Do 60% packet loss for the entire network card Eth0, excluding ports 22 and 8000 to 8080
  blade create network loss --percent 60 --interface eth0 --exclude-port 22,8000-8080

  # Realize the whole network card is not accessible, not accessible time 20 seconds. After executing the following command, the current network is disconnected and restored in 20 seconds. Remember!! Don't forget -timeout parameter
  blade create network loss --percent 100 --interface eth0 --timeout 20

  # Specify the network card eth0 and repeat the packet by 10%
  blade create network duplicate --percent=10 --interface=eth0

  # Access to the specified IP request packet is corrupted, 80% of the time
  blade create network corrupt --percent 80 --destination-ip 180.101.49.12 --interface eth0

  # Access the specified IP request packet disorder
  blade c network reorder --correlation 80 --percent 50 --gap 2 --time 500 --interface eth0 --destination-ip 180.101.49.12

  # Specify port 8080 occupancy
  blade c network occupy --port 8080 --force

  # The machine accesses external 14.215.177.39 machine (ping www.baidu.com) 80 port packet loss rate 100%
  blade create network loss --percent 100 --interface eth0 --remote-port 80 --destination-ip 14.215.177.39

````

