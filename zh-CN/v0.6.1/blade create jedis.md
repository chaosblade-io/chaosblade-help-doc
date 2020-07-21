# blade create jedis

# **Introduction**
jedis experiment contains delay and exception by command and so on.
* [blade create jedis delay](blade create jedis delay.md)	delay time
* [blade create jedis throwCustomException](blade create jedis throwCustomException.md)	throw custom exception


# **Example**
````
  # Do a delay 2s experiment on Jedis `hset key name lina` command
  blade create jedis delay --cmd hset --key name --time 2000

  # Do a delay 2s experiment on Jedis `key name lina` command
  blade create jedis delay --key name --time 2000

  # Do a throws custom exception experiment on Jedis `key name lina` command
  blade create jedis throwCustomException --exception java.lang.Exception --key name

````

