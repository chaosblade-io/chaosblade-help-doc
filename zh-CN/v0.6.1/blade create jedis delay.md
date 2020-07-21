# blade create jedis delay

# **Introduction**
Jedis commands delay experiments
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
--time
	delay time
--offset
	delay offset for the time
--process
	Application process name
--pid
	The process id

```

# **Example**

````
# Do a delay 2s experiment on Jedis `hset key name lina` command
blade create jedis delay --cmd hset --key name --time 2000
````
````
# Do a delay 2s experiment on Jedis `key name lina` command
blade create jedis delay --key name --time 2000
````


