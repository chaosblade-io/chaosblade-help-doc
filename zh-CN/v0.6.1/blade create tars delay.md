# blade create tars delay

# **Introduction**
Tars delay experiment
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
# Do a delay 3s experiment on tars interface
blade create tars delay --time 3000 --client --servantname app.server.obj --functionname hello
````


