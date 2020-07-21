# blade create servlet

# **Introduction**
Java servlet experiment, support path, query string, request method matcher
* [blade create servlet delay](blade create servlet delay.md)	delay time
* [blade create servlet throwCustomException](blade create servlet throwCustomException.md)	throw custom exception


# **Example**
````
  # Request to http://localhost:8080/dubbodemo/servlet/path?name=bob delays 3s, effect two requests
  blade c servlet delay --time 3000 --requestpath /dubbodemo/servlet/path --effect-count 2

  # The request parameter is name=family, the delay is 2 seconds, the delay time floats up and down for 1 second, the impact range is 50% of the request, and the debug log is turned on to troubleshoot the problem
  blade c servlet delay --time 2000 --offset 1000 --querystring name=family --effect-percent 50 --debug

  # Request to http://localhost:8080/dubbodemo/hello throws custom exception, effect three requests
  blade c servlet throwCustomException --exception org.springframework.beans.BeansException --exception-message mock-beans-exception --requestpath /hello --effect-count 3

````

