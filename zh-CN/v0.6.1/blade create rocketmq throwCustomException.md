# blade create rocketmq throwCustomException

# **Introduction**
RocketMq throws custom exception experiment
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
# Do a throw custom exception experiment on the RocketMq when topic=xx consumerGroup=xx
blade create rocketmq throwCustomException --exception java.lang.Exception --topic=xx --consumerGroup=xx
````


