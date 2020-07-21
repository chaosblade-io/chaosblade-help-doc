# blade create cpu fullload

# **Introduction**
The kubernetes Node cpu scenario is the same as the cpu scenario of the underlying resource
# **Flags**

```
--cpu-count
	Cpu count
--cpu-list
	CPUs in which to allow burning (0-3 or 1,3)
--cpu-percent
	percent of burn CPU (0-100)
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

 面以指定一台节点，做 CPU 负载 80% 实验举例。
 
 **yaml 配置方式** 
 ```yaml
 apiVersion: chaosblade.io/v1alpha1
 kind: ChaosBlade
 metadata:
   name: cpu-load
 spec:
   experiments:
   - scope: node
     target: cpu
     action: fullload
     desc: "increase node cpu load by names"
     matchers:
     - name: names
       value:
       - "cn-hangzhou.192.168.0.205"
     - name: cpu-percent
       value:
       - "80"
 ```
 例如配置好文件后，保存为 chaosblade_cpu_load.yaml，使用以下命令执行实验场景：
  ```
  kubectl apply -f chaosblade_cpu_load.yaml
  ```
  可通过以下命令查看每个实验的执行状态：
  ```
  kubectl get blade cpu-load -o json
  ```
 更多的实验场景配置事例可查看: https://github.com/chaosblade-io/chaosblade-operator/tree/v0.0.1/examples
 
 **blade 命令执行方式**
 下载 chaosblade 工具包，下载地址：https://github.com/chaosblade-io/chaosblade/releases/tag/v0.4.0-alpha ，解压即可使用。还是上述例子，使用 blade 命令执行如下：
 ```shell
 blade create k8s node-cpu fullload --names cn-hangzhou.192.168.0.205 --cpu-percent 80 --kubeconfig ~/.kube/config 
 ```
 使用 blade 命令执行，如果执行失败，会返回详细的错误信息；如果执行成功，会返回实验的 UID，使用查询命令可以查询详细的实验结果：
 ```
 blade query k8s create <UID>
 ```
 
 ## 修改实验
 yaml 配置文件的方式支持场景动态修改，比如将上述的 cpu 负载调整为 60%，则只需将上述 value 的值从 80 改为 60 即可，例如：
 ```yaml
 apiVersion: chaosblade.io/v1alpha1
 kind: ChaosBlade
 metadata:
   name: cpu-load
 spec:
   experiments:
   - scope: node
     target: cpu
     action: fullload
     desc: "increase node cpu load by names"
     matchers:
     - name: names
       value:
       - "cn-hangzhou.192.168.0.205"
     - name: cpu-percent
       value:
       - "60"
 ```
 然后使用 `kubeclt apply -f chaosblade_cpu_load.yaml` 命令执行更新即可。
 
 ## 销毁实验
 可以通过以下三种方式停止实验：
 **根据实验资源名停止**
 比如上述 cpu-load 场景，可以执行以下命令停止实验
 ```
 kubectl delete chaosblade cpu-load
 ```
 
 **通过 yaml 配置文件停止**
 指定上述创建好的 yaml 文件进行删除，命令如下：
 ```
 kubectl delete -f chaosblade_cpu_load.yaml
 ```
 
 **通过 blade 命令停止**
 此方式仅限使用 blade 创建的实验，使用以下命令停止：
 ```
 blade destroy <UID>
 ```
 <UID> 是执行 blade create 命令返回的结果，如果忘记，可使用 blade status --type create 命令查询

