# blade create script delay

# **Introduction**
Sleep in script
# **Flags**

```
--time
	sleep time, unit is millisecond
--file
	Script file full path
--function-name
	function name in shell
--timeout
	set timeout for experiment

```

# **Example**

````
# Add commands to the script `start0() { sleep 10.000000 ...}`
blade create script delay --time 10000 --file test.sh --function-name start0
````


