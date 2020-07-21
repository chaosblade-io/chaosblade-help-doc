# blade create mem load

# **Introduction**
Create chaos engineering experiments with memory load
# **Flags**

```
--mem-percent
	percent of burn Memory (0-100)
--reserve
	reserve to burn Memory, unit is MB. If the mem-percent flag exist, use mem-percent first.
--rate
	burn memory rate, unit is M/S, only support for ram mode.
--mode
	burn memory mode, cache or ram.
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
# The execution memory footprint is 50%
blade c mem load --mode ram --mem-percent 50
````
````
# 200M memory is reserved, and the total memory size is 1G
blade c mem load --mode ram --reserve 200 --rate 100
````


