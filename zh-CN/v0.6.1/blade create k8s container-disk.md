# blade create disk

# **Introduction**
Disk experiment contains fill disk or burn io
* [blade create k8s container-disk fill](blade create k8s container-disk fill.md)	Fill the specified directory path
* [blade create k8s container-disk burn](blade create k8s container-disk burn.md)	Increase disk read and write io load


# **Example**
````
  # Perform a disk fill of 40G to achieve a full disk (34G available)
  blade create disk fill --path /home --size 40000

  # Performs populating the disk by percentage, and retains the file handle that populates the disk
  blade c disk fill --path /home --percent 80 --retain-handle

  # Perform a fixed-size experimental scenario
  blade c disk fill --path /home --reserve 1024

  # Observe the disk IO read/write load before performing the experiment
  iostat -x -t 2

  # The data of rkB/s, wkB/s and % Util were mainly observed. Perform disk read IO high-load scenarios
  blade create disk burn --read --path /home

  # Perform disk write IO high-load scenarios
  blade create disk burn --write --path /home

  # Read and write IO load scenarios are performed at the same time. Path is not specified. The default is /
  blade create disk burn --read --write

````

