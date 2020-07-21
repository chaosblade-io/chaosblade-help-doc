# blade create http throwCustomException

# **Introduction**
HTTP client throws custom exception experiment
# **Flags**

```
--httpclient4
	To tag httpclient4 experiment.
--rest
	To tag restTemplate experiment.
--httpclient3
	To tag httpclient3 experiment.
--effect-count
	The count of chaos experiment in effect
--effect-percent
	The percent of chaos experiment in effect
--uri
	url
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
# Do a throws custom exception with HTTP request URI = https://www.taobao.com/ for HttpClient4
blade c http throwCustomException --httpclient4 --exception=java.lang.Exception --exception-message=customException --uri=https://www.taobao.com/
````


