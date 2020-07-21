# blade create cpu fullload

# **Introduction**
The CPU load experiment scenario in docker container is the same as the CPU scenario of basic resources
# **Flags**

```
--cpu-count
	Cpu count
--cpu-list
	CPUs in which to allow burning (0-3 or 1,3)
--cpu-percent
	percent of burn CPU (0-100)
--container-id
	Container id
--image-repo
	Image repository of the chaosblade-tool
--image-version
	Image version of the chaosblade-tool
--docker-endpoint
	Docker socket endpoint
--blade-tar-file
	The pull path of the ChaosBlade tar package, for example, --blade-tar-file /opt/chaosblade-0.4.0.tar.gz
--blade-override
	Override the exists chaosblade tool in the target container or not, default value is false
--timeout
	set timeout for experiment

```

# **Example**

````
# Do an 80% CPU utilization scenario for a Container ID of 5239E26F6329
blade create docker cpu fullload --cpu-percent 80 --blade-tar-file /root/chaosblade-0.4.0.tar.gz --container-id 5239e26f6329
````


