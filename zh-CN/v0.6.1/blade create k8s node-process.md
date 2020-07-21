# blade create process

# **Introduction**
Process experiment, for example, kill process
* [blade create k8s node-process kill](blade create k8s node-process kill.md)	Kill process
* [blade create k8s node-process stop](blade create k8s node-process stop.md)	process fake death


# **Example**
````
  # Kill the process that contains the `SimpleHTTPServer` keyword
  blade create process kill --process SimpleHTTPServer

  # Kill the Java process
  blade create process kill --process-cmd java

  # Specifies the semaphore and local port to kill the process
  blade c process kill --local-port 8080 --signal 15

  # Pause the process that contains the `SimpleHTTPServer` keyword
  blade create process stop --process SimpleHTTPServer

  # Pause the Java process
  blade create process stop --process-cmd java

````

