# blade create mysql throwCustomException

# **Introduction**
Mysql throws customer exception experiment
# **Flags**

```
--sqltype
	The sql type, for example, select, update and so on.
--database
	The database name which used
--effect-count
	The count of chaos experiment in effect
--effect-percent
	The percent of chaos experiment in effect
--port
	The database port which used
--host
	The database host
--table
	The first table name in sql.
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
# Do a throws customer exception experiment for mysql client connection port=3306 INSERT statement
blade create mysql throwCustomException --exception java.lang.Exception
````


