# blade create http delay

# **Introduction**
HTTP client delay experiment
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
# Do a delay 3s experiment with HTTP request URI = https://www.taobao.com/ for HttpClient4
blade create http delay --httpclient4 --uri https://www.taobao.com/ --time 3000
````
````
# Do a delay 3s experiment with HTTP request URI = https://www.taobao.com/ for HttpClient3
blade create http delay --httpclient3 --uri https://www.taobao.com/ --time 3000
````
````
# Do a delay 3s experiment with HTTP request URI = https://www.taobao.com/ for RestTemplate
blade create http delay --rest --uri https://www.taobao.com/ --time 3000
````
````
# Do a delay 3s experiment with HTTP request URI = https://www.taobao.com/ for OkHttp3
blade create http delay --okhttp3 --uri https://www.taobao.com/ --time 3000
````


