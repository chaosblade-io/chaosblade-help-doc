# blade create servlet throwCustomException

# **Introduction**
Servlet throw custom exception experiment, support servlet springMVC webX
# **Flags**

```
--effect-count
	The count of chaos experiment in effect
--effect-percent
	The percent of chaos experiment in effect
--method
	The name of the HTTP method with which this request was made, for example, GET, POST, or PUT.
--querystring
	The query string that is contained in the request URL after the path.
--requestpath
	equal RequestUri without ContextPath
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
# Request to http://localhost:8080/dubbodemo/hello throws custom exception, effect three requests
blade c servlet throwCustomException --exception org.springframework.beans.BeansException --exception-message mock-beans-exception --requestpath /hello --effect-count 3
````


