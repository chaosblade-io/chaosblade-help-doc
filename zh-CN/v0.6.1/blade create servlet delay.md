# blade create servlet delay

# **Introduction**
Servlet delay experiment, support servlet springMVC webX
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
# Request to http://localhost:8080/dubbodemo/servlet/path?name=bob delays 3s, effect two requests
blade c servlet delay --time 3000 --requestpath /dubbodemo/servlet/path --effect-count 2
````
````
# The request parameter is name=family, the delay is 2 seconds, the delay time floats up and down for 1 second, the impact range is 50% of the request, and the debug log is turned on to troubleshoot the problem
blade c servlet delay --time 2000 --offset 1000 --querystring name=family --effect-percent 50 --debug
````


