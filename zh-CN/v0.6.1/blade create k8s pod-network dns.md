# blade create network dns

# **Introduction**
Kubernetes pod network scenarios, the same as the network scenario of basic resources
# **Flags**

```
--domain
	Domain name
--ip
	Domain ip
--evict-count
	Count of affected resource
--evict-percent
	Percent of affected resource, integer value without %
--names
	Resource names, such as pod name. You must add namespace flag for it. Multiple parameters are separated directly by commas
--namespace
	Namespace, such as default, only one value can be specified
--labels
	Label selector, the relationship between values that are or
--evict-group
	Group key from labels
--timeout
	set timeout for experiment

```

# **Example**

````
# The domain name www.baidu.com is not accessible
blade create network dns --domain www.baidu.com --ip 10.0.0.0
````


