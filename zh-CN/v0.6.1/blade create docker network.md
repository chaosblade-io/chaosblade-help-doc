# blade create network

# **Introduction**
Network experiment
* [blade create docker network delay](blade create docker network delay.md)	Delay experiment
* [blade create docker network drop](blade create docker network drop.md)	Drop experiment
* [blade create docker network dns](blade create docker network dns.md)	Dns experiment
* [blade create docker network loss](blade create docker network loss.md)	Loss network package
* [blade create docker network duplicate](blade create docker network duplicate.md)	Duplicate experiment
* [blade create docker network corrupt](blade create docker network corrupt.md)	Corrupt experiment
* [blade create docker network reorder](blade create docker network reorder.md)	Reorder experiment
* [blade create docker network occupy](blade create docker network occupy.md)	Occupy the specify port


# **Example**
````
  # Access to nginx container port 80 is delayed by 3 seconds
  blade create docker network delay --time 3000 --interface eth0 --local-port 80 --container-id 5239e26f6329

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

