# blade create dubbo

# **Introduction**
Dubbo experiment for testing service delay and exception.
* [blade create dubbo delay](blade create dubbo delay.md)	delay time
* [blade create dubbo throwCustomException](blade create dubbo throwCustomException.md)	throw custom exception
* [blade create dubbo threadpoolfull](blade create dubbo threadpoolfull.md)	Thread pool full


# **Example**
````
  # Invoke com.alibaba.demo.HelloService.hello() service, do delay 3 seconds experiment
  blade create dubbo delay --time 3000 --service com.alibaba.demo.HelloService --methodname hello --consumer

  # Invoke com.alibaba.demo.HelloService.hello() service, do throws customer exception
  blade create dubbo throwCustomException --exception java.lang.Exception --service com.alibaba.demo.HelloService --methodname hello --consumer

  # Do a full load experiment on the Dubbo provider thread pool
  blade c dubbo threadpoolfull --provider

````

