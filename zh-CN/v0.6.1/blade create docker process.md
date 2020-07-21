# blade create process

# **Introduction**
Process experiment, for example, kill process
* [blade create docker process kill](blade create docker process kill.md)	Kill process
* [blade create docker process stop](blade create docker process stop.md)	process fake death


# **Example**
````
  # Kill the nginx process in the container
  blade create docker process kill --process nginx --blade-tar-file /root/chaosblade-0.4.0.tar.gz --container-id ee54f1e61c08

  # Stop the nginx process in the container
  blade create docker process stop --process nginx --blade-tar-file /root/chaosblade-0.4.0.tar.gz --container-id ee54f1e61c08

````

