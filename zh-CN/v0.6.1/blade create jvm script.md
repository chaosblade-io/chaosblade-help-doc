# blade create jvm script

# **Introduction**
Dynamically execute custom scripts
# **Flags**

```
--effect-count
	The count of chaos experiment in effect
--classname
	The class name with package
--effect-percent
	The percent of chaos experiment in effect
--after
	Specify the method after event
--methodname
	The method name
--script-file
	The Script file full path
--script-type
	The script file type, java or groovy, default value is java
--script-content
	The script contents
--script-name
	The script name for label, unnecessary
--process
	Application process name
--pid
	The process id

```

# **Example**

````
# Using script-Content to specify walk-through script content, without adding a script-type parameter, it defaults to a Java script and calls the Java engine parser.
blade c jvm script --classname com.example.controller.DubboController --methodname call --script-content aW1wb3J0IGphdmEudXRpbC5NYXA7CgppbXBvcnQgY29tLmV4YW1wbGUuY29udHJvbGxlci5DdXN0b21FeGNlcHRpb247CgovKioKICogQGF1dGhvciBDaGFuZ2p1biBYaWFvCiAqLwpwdWJsaWMgY2xhc3MgRXhjZXB0aW9uU2NyaXB0IHsKICAgIHB1YmxpYyBPYmplY3QgcnVuKE1hcDxTdHJpbmcsIE9iamVjdD4gcGFyYW1zKSB0aHJvd3MgQ3VzdG9tRXhjZXB0aW9uIHsKICAgICAgICBwYXJhbXMucHV0KCIxIiwgMTExTCk7CiAgICAgICAgLy9yZXR1cm4gIk1vY2sgVmFsdWUiOwogICAgICAgIC8vdGhyb3cgbmV3IEN1c3RvbUV4Y2VwdGlvbigiaGVsbG8iKTsKICAgICAgICByZXR1cm4gbnVsbDsKICAgIH0KfQo=  --script-name exception
````
````
# Use the script-file parameter to specify the file experiment
blade c jvm script --classname com.example.controller.DubboController --methodname call --script-file /tmp/ExceptionScript.java --script-name exception
````
````
# The groovy script experiment scenario is executed with the same parameters as above, but the --script-type Groovy parameter must be added
blade c jvm script --classname com.example.controller.DubboController --methodname call --script-file /tmp/GroovyScript.groovy --script-name exception --script-type groovy
````


