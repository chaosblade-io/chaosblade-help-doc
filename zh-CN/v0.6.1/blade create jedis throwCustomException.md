# blade create jedis throwCustomException

# **Introduction**
Jedis commands throws custom exception experiments
# **Flags**

```
--effect-count
	The count of chaos experiment in effect
--effect-percent
	The percent of chaos experiment in effect
--cmd
	The cmd type, for example, set, hget,zadd and so on.
--key
	The key which command used
--exception
	Exception class inherit java.lang.Exception
--exception-message
	Specify exception message for exception experiment, default value is chaosblade-mock-exception
--process
	Application process name
--pid
	The process id

```

# **Example**

````
# Do a throws custom exception experiment on Jedis `key name lina` command
blade create jedis throwCustomException --exception java.lang.Exception --key name
````


