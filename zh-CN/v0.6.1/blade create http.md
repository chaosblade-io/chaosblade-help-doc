# blade create http

# **Introduction**
Experiment with the http client, support --httpclient3 --httpclient4 --okhttp3 --rest.
* [blade create http delay](blade create http delay.md)	delay time
* [blade create http throwCustomException](blade create http throwCustomException.md)	throw custom exception


# **Example**
````
  # Do a delay 3s experiment with HTTP request URI = https://www.taobao.com/ for HttpClient4
  blade create http delay --httpclient4 --uri https://www.taobao.com/ --time 3000

  # Do a delay 3s experiment with HTTP request URI = https://www.taobao.com/ for HttpClient3
  blade create http delay --httpclient3 --uri https://www.taobao.com/ --time 3000

  # Do a delay 3s experiment with HTTP request URI = https://www.taobao.com/ for RestTemplate
  blade create http delay --rest --uri https://www.taobao.com/ --time 3000

  # Do a delay 3s experiment with HTTP request URI = https://www.taobao.com/ for OkHttp3
  blade create http delay --okhttp3 --uri https://www.taobao.com/ --time 3000

  # Do a throws custom exception with HTTP request URI = https://www.taobao.com/ for HttpClient4
  blade c http throwCustomException --httpclient4 --exception=java.lang.Exception --exception-message=customException --uri=https://www.taobao.com/

````

