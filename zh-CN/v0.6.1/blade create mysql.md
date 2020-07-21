# blade create mysql

# **Introduction**
Mysql experiment contains delay and exception by table name and so on.
* [blade create mysql delay](blade create mysql delay.md)	delay time
* [blade create mysql throwCustomException](blade create mysql throwCustomException.md)	throw custom exception


# **Example**
````
  # Do a delay 2s experiment for mysql client connection port=3306 INSERT statement
  blade create mysql --sqltype select --port 3306

  # Do a throws customer exception experiment for mysql client connection port=3306 INSERT statement
  blade create mysql throwCustomException --exception java.lang.Exception

````

