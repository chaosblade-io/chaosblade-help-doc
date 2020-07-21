# blade create jvm throwCustomException

# **Introduction**
Throw custom exception with --exception option
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
# Inject a custom exception failure on the com.example.controller.DubboController.hello() method, effect the two requests
blade c jvm throwCustomException --exception java.lang.Exception --classname com.example.controller.DubboController --methodname sayHello --effect-count 2
````


