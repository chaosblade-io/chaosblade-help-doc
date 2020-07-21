# blade create jvm OutOfMemoryError

# **Introduction**
JVM out of memory experiment
# **Flags**

```
--area
	Jvm memory area you want to cause OutOfMemoryError,the options:[HEAP, NOHEAP, OFFHEAP]
--wild-mode
	Decide oom happen mode in wild-mode or not,default is false,if true,will quickly generate oom error,and the memory  will not release until stop,if false,the oom error will not generate at once,and if oom happens frequently,the  memory will release each once
--interval
	Time between to oom error,the time unit is millis,default is 500 ms,only used when wilde-mode not true
--block
	Each block size when fill memory,only used for Heap OffHeap Area,Unit:MB
--process
	Application process name
--pid
	The process id

```

# **Example**

````
# The Heap area is filled with memory.
blade c jvm oom --area HEAP --wild-mode true
````
````
# The Metaspace area is filled with memory. Note that after executing this experiment, the application needs to be restarted ！！！
blade c jvm oom --area NOHEAP --wild-mode true
````


