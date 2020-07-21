# blade create rocketmq delay

# **Introduction**
RocketMq delay experiment
# **Flags**

```
--producerGroup
	Message producer group
--effect-count
	The count of chaos experiment in effect
--effect-percent
	The percent of chaos experiment in effect
--topic
	Message topic
--consumerGroup
	Message consumer group
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
# Do a delay 3s experiment on the RocketMq when topic=xx consumerGroup=xx
blade create rocketmq --topic=xx --consumerGroup=xx delay --time=3000
````


