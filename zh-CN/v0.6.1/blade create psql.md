# blade create psql

# **Introduction**
Postgrelsql experiment contains delay and exception by table name and so on.
* [blade create psql delay](blade create psql delay.md)	delay time
* [blade create psql throwCustomException](blade create psql throwCustomException.md)	throw custom exception


# **Example**
````
  # Do a delay 2s experiment for Postgrelsql client INSERT statement
  blade create psql delay --sqltype insert --time 4000

  # Do a throws custom exception experiment for Postgrelsql client INSERT statement
  blade create psql throwCustomException --sqltype insert --exception java.lang.Exception

````

