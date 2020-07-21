# blade create mysql delay

# **Introduction**
Mysql delay experiment
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
# Do a delay 2s experiment for mysql client connection port=3306 INSERT statement
blade create mysql --sqltype select --port 3306
````


