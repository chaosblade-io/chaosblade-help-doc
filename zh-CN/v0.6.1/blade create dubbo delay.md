# blade create dubbo delay

# **Introduction**
Dubbo interface to do delay experiments, support provider and consumer
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
# Invoke com.alibaba.demo.HelloService.hello() service, do delay 3 seconds experiment
blade create dubbo delay --time 3000 --service com.alibaba.demo.HelloService --methodname hello --consumer
````


