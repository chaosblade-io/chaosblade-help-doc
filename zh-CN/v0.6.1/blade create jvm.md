# blade create jvm

# **Introduction**
Experiment with the JVM, and you can specify classes, method injection delays, return values, exception failure scenarios, or write Groovy and Java scripts to implement complex scenarios.
* [blade create jvm CodeCacheFilling](blade create jvm CodeCacheFilling.md)	Fill up code cache.
* [blade create jvm delay](blade create jvm delay.md)	delay time
* [blade create jvm throwCustomException](blade create jvm throwCustomException.md)	throw custom exception
* [blade create jvm cpufullload](blade create jvm cpufullload.md)	Process occupied cpu full load
* [blade create jvm throwDeclaredException](blade create jvm throwDeclaredException.md)	Throw the first declared exception of method
* [blade create jvm return](blade create jvm return.md)	Return the specify value
* [blade create jvm script](blade create jvm script.md)	Dynamically execute custom scripts
* [blade create jvm OutOfMemoryError](blade create jvm OutOfMemoryError.md)	JVM out of memory experiment


# **Example**
````
  # Inject code cache full fault
  blade c jvm CodeCacheFilling --process tomcat

  # Inject a 4-second delay failure on the sayHello method
  blade c jvm delay --time 4000 --classname=com.example.controller.DubboController --methodname=sayHello

  # Inject a custom exception failure on the com.example.controller.DubboController.hello() method, effect the two requests
  blade c jvm throwCustomException --exception java.lang.Exception --classname com.example.controller.DubboController --methodname sayHello --effect-count 2

  # Specifies full load of all kernel
  blade c jvm cfl --process tomcat

  # Specifies full load of two kernel
  blade c jvm cfl --cpu-count 2 --process tomcat

  # Throw the first declared exception of method, effect the two requests
  blade c jvm throwDeclaredException --classname com.example.controller.DubboController --methodname sayHello --effect-count 2

  # Inject a tamper return value failure on the com.example.controller.DubboController.hello() method
  blade c jvm return --value hello-chaosblade --classname com.example.controller.DubboController --methodname hello

  # Using script-Content to specify walk-through script content, without adding a script-type parameter, it defaults to a Java script and calls the Java engine parser.
  blade c jvm script --classname com.example.controller.DubboController --methodname call --script-content aW1wb3J0IGphdmEudXRpbC5NYXA7CgppbXBvcnQgY29tLmV4YW1wbGUuY29udHJvbGxlci5DdXN0b21FeGNlcHRpb247CgovKioKICogQGF1dGhvciBDaGFuZ2p1biBYaWFvCiAqLwpwdWJsaWMgY2xhc3MgRXhjZXB0aW9uU2NyaXB0IHsKICAgIHB1YmxpYyBPYmplY3QgcnVuKE1hcDxTdHJpbmcsIE9iamVjdD4gcGFyYW1zKSB0aHJvd3MgQ3VzdG9tRXhjZXB0aW9uIHsKICAgICAgICBwYXJhbXMucHV0KCIxIiwgMTExTCk7CiAgICAgICAgLy9yZXR1cm4gIk1vY2sgVmFsdWUiOwogICAgICAgIC8vdGhyb3cgbmV3IEN1c3RvbUV4Y2VwdGlvbigiaGVsbG8iKTsKICAgICAgICByZXR1cm4gbnVsbDsKICAgIH0KfQo=  --script-name exception

  # Use the script-file parameter to specify the file experiment
  blade c jvm script --classname com.example.controller.DubboController --methodname call --script-file /tmp/ExceptionScript.java --script-name exception

  # The groovy script experiment scenario is executed with the same parameters as above, but the --script-type Groovy parameter must be added
  blade c jvm script --classname com.example.controller.DubboController --methodname call --script-file /tmp/GroovyScript.groovy --script-name exception --script-type groovy

  # The Heap area is filled with memory.
  blade c jvm oom --area HEAP --wild-mode true

  # The Metaspace area is filled with memory. Note that after executing this experiment, the application needs to be restarted ！！！
  blade c jvm oom --area NOHEAP --wild-mode true

````

