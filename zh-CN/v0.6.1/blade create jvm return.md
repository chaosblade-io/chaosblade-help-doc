# blade create jvm return

# **Introduction**
Return the specify value
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
--value
	Value returned, only support primitive type value. If you want return null, set --value null
--process
	Application process name
--pid
	The process id

```

# **Example**

````
# Inject a tamper return value failure on the com.example.controller.DubboController.hello() method
blade c jvm return --value hello-chaosblade --classname com.example.controller.DubboController --methodname hello
````


