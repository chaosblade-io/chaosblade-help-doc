# blade create rocketmq

# **Introduction**
Rocketmq experiment,can make message send or pull delay and exception,default if you not set [producerGroup,consumerGroup],will effect both send and pull message,if you only set producerGroup for specific group,will only effect on sendMessage,if you only set consumerGroup,will only effect pullMessage for specific group
* [blade create rocketmq delay](blade create rocketmq delay.md)	delay time
* [blade create rocketmq throwCustomException](blade create rocketmq throwCustomException.md)	throw custom exception


# **Example**
````
  # Do a delay 3s experiment on the RocketMq when topic=xx consumerGroup=xx
  blade create rocketmq --topic=xx --consumerGroup=xx delay --time=3000

  # Do a throw custom exception experiment on the RocketMq when topic=xx consumerGroup=xx
  blade create rocketmq throwCustomException --exception java.lang.Exception --topic=xx --consumerGroup=xx

````

