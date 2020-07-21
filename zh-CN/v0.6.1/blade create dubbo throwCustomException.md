# blade create dubbo throwCustomException

# **Introduction**
Dubbo interface to do throws custom exception experiments, support provider and consumer
# **Flags**

```
--effect-count
	The count of chaos experiment in effect
--effect-percent
	The percent of chaos experiment in effect
--appname
	The consumer or provider application name
--provider
	To tag provider experiment
--service
	The service interface
--version
	the service version
--consumer
	To tag consumer role experiment.
--methodname
	The method name
--group
	The service group
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
# Invoke com.alibaba.demo.HelloService.hello() service, do throws customer exception
blade create dubbo throwCustomException --exception java.lang.Exception --service com.alibaba.demo.HelloService --methodname hello --consumer
````


