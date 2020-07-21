# blade create tars

# **Introduction**
Tars experiment for testing service delay and exception.
* [blade create tars delay](blade create tars delay.md)	delay time
* [blade create tars throwCustomException](blade create tars throwCustomException.md)	throw custom exception


# **Example**
````
  # Do a delay 3s experiment on tars interface
  blade create tars delay --time 3000 --client --servantname app.server.obj --functionname hello

  # Do a throw custom exception experiment on tars interface
  blade c tars throwCustomException --exception org.springframework.beans.BeansException --exception-message mock-beans-exception --client --servantname=app.server.obj

````

