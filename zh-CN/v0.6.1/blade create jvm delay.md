# blade create jvm delay

# **Introduction**
The Java method delays the experiment
# **Flags**

```
--effect-count
	The count of chaos experiment in effect
--effect-percent
	The percent of chaos experiment in effect
--classname
	The class name with package
--after
	Specify the method after event
--methodname
	The method name
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
# Inject a 4-second delay failure on the sayHello method
blade c jvm delay --time 4000 --classname=com.example.controller.DubboController --methodname=sayHello
````


