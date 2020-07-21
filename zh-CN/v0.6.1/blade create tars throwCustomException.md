# blade create tars throwCustomException

# **Introduction**
Tars throws custom exception experiment
# **Flags**

```
--servant
	to tag servant role experiment
--effect-count
	The count of chaos experiment in effect
--effect-percent
	The percent of chaos experiment in effect
--functionname
	The name of function to be invoked
--client
	to tag the client role experiment
--servantname
	The name of servant
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
# Do a throw custom exception experiment on tars interface
blade c tars throwCustomException --exception org.springframework.beans.BeansException --exception-message mock-beans-exception --client --servantname=app.server.obj
````


