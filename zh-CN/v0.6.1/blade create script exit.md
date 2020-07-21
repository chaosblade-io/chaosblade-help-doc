# blade create script exit

# **Introduction**
Exit script with specify message and code
# **Flags**

```
--exit-code
	Exit code
--exit-message
	Exit message
--file
	Script file full path
--function-name
	function name in shell
--timeout
	set timeout for experiment

```

# **Example**

````
# Add commands to the script `start0() { echo this-is-error-message; exit 1; ... }`
blade create script exit --exit-code 1 --exit-message this-is-error-message --file test.sh --function-name start0
````


