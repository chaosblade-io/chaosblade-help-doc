# blade create process stop

# **Introduction**
The process scenario in docker container is the same as the basic resource process scenario
# **Flags**

```
--process
	Process name
--process-cmd
	Process name in command
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
# Stop the nginx process in the container
blade create docker process stop --process nginx --blade-tar-file /root/chaosblade-0.4.0.tar.gz --container-id ee54f1e61c08
````


