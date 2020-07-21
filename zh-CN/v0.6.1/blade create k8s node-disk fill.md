# blade create disk fill

# **Introduction**
The kubernetes Node disk scenario is the same as the disk scenario of the underlying resource
# **Flags**

```
--path
	The path of directory where the disk is populated, default value is /
--size
	Disk fill size, unit is MB. The value is a positive integer without unit, for example, --size 1024
--percent
	Total percentage of disk occupied by the specified path. If size and the flag exist, use this flag first. The value must be positive integer without %
--reserve
	Disk reserve size, unit is MB. The value is a positive integer without unit. If size, percent and reserve flags exist, the priority is as follows: percent > reserve > size
--retain-handle
	Whether to retain the big file handle, default value is false.
--evict-count
	Count of affected resource
--evict-percent
	Percent of affected resource, integer value without %
--names
	Resource names, such as pod name. You must add namespace flag for it. Multiple parameters are separated directly by commas
--labels
	Label selector, the relationship between values that are or
--timeout
	set timeout for experiment

```

# **Example**

### 指定节点磁盘占用 80%

**blade 命令执行方式**

```shell
blade c k8s node-disk fill --names cn-hangzhou.192.168.0.35 --percent 80 --kubeconfig ~/.kube/config
{"code":200,"success":true,"result":"ec322fbb977a455c"}

df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/vda1                 118.0G     89.0G     24.0G  79% / 

# 恢复实验
blade d ec322fbb977a455c

{"code":200,"success":true,"result":{"Target":"node-disk","Scope":"","ActionName":"fill","ActionFlags":{"kubeconfig":"~/.kube/config","names":"cn-hangzhou.192.168.0.35","percent":"80"}}}

df -h
Filesystem                Size      Used Available Use% Mounted on
/dev/vda1                 118.0G     74.8G     38.1G  66% /
```

使用 blade 命令执行，如果执行失败，会返回详细的错误信息；如果执行成功，会返回实验的 UID，使用查询命令可以查询详细的实验结果：

```
blade query k8s create <UID>
```



