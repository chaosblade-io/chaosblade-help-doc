# blade create cpu fullload

# **Introduction**
The CPU load experiment scenario in docker container is the same as the CPU scenario of basic resources
# **Flags**

```
--cpu-count
	Cpu count
--cpu-list
	CPUs in which to allow burning (0-3 or 1,3)
--cpu-percent
	percent of burn CPU (0-100)
--container-id
	Container id
--image-repo
	Image repository of the chaosblade-tool
--image-version
	Image version of the chaosblade-tool
--docker-endpoint
	Docker socket endpoint
--blade-tar-file
	The pull path of the ChaosBlade tar package, for example, --blade-tar-file /opt/chaosblade-0.4.0.tar.gz
--blade-override
	Override the exists chaosblade tool in the target container or not, default value is false
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
--container-ids
	Container ids
--container-names
	Container names
--timeout
	set timeout for experiment

```

# **Example**

``指定 default 命名空间下 Pod 名为 frontend-d89756ff7-pbnnc，容器id为 2ff814b246f86，做 CPU 负载 100% 实验举例。

**yaml 配置方式** 

```yaml
apiVersion: chaosblade.io/v1alpha1
kind: ChaosBlade
metadata:
  name: increase-container-cpu-load-by-id
spec:
  experiments:
  - scope: container
    target: cpu
    action: fullload
    desc: "increase container cpu load by id"
    matchers:
    - name: container-ids
      value:
      - "2ff814b246f86"
    - name: cpu-percent
      value: ["100"]
      # pod names
    - name: names
      value: ["frontend-d89756ff7-pbnnc"]
```

例如配置好文件后，保存为 increase_container_cpu_load_by_id.yaml，使用以下命令执行实验场景：

 ```
 kubectl apply -f increase_container_cpu_load_by_id.yaml
 ```

 可通过以下命令查看每个实验的执行状态：

 ```
 kubectl get blade increase-container-cpu-load-by-id -o json
 ```

 ```json
{
    "apiVersion": "chaosblade.io/v1alpha1",
    "kind": "ChaosBlade",
    "metadata": {
        "finalizers": [
            "finalizer.chaosblade.io"
        ],
        "generation": 1,
        "name": "increase-container-cpu-load-by-id",
        "resourceVersion": "9432486",
        "selfLink": "/apis/chaosblade.io/v1alpha1/chaosblades/increase-container-cpu-load-by-id",
        "uid": "737ae2e8-ff79-11e9-a8e2-00163e08a39b"
    },
    "status": {
        "expStatuses": [
            {
                "action": "fullload",
                "resStatuses": [
                    {
                        "id": "2bcb4178003f46fe",
                        "kind": "container",
                        "name": "php-redis",
                        "nodeName": "cn-hangzhou.192.168.0.204",
                        "state": "Success",
                        "success": true,
                        "uid": "2ff814b246f86aba2392379640e4c6b16efbfd61846fc419a24f8d8ccf0f86f0"
                    }
                ],
                "scope": "container",
                "state": "Success",
                "success": true,
                "target": "cpu"
            }
        ],
        "phase": "Running"
    }
}
 ```

 通过资源监控，可以看到此 Pod 下 CPU 使用情况
 ![monitor](https://user-images.githubusercontent.com/3992234/68177462-5cac1d80-ffc3-11e9-8c8f-4854f3eb4315.png)

使用以下命令停止实验：

```
kubectl delete -f examples/increase_container_cpu_load_by_id.yaml 
```

**blade 命令执行方式**

```shell
blade create k8s container-cpu fullload --cpu-percent 100 --container-ids 2ff814b246f86 --names frontend-d89756ff7-pbnnc --namespace default --kubeconfig config 
```

如果执行失败，会返回详细的错误信息；如果执行成功，会返回实验的 UID：

```
{"code":200,"success":true,"result":"092e8b4d88d4f449"}
```

可通过以下命令查询实验状态：

```
blade query k8s create 092e8b4d88d4f449 --kubeconfig config

{"code":200,"success":true,"result":{"uid":"092e8b4d88d4f449","success":true,"error":"","statuses":[{"id":"eab5fb70b61c9c45","uid":"2ff814b246f86aba2392379640e4c6b16efbfd61846fc419a24f8d8ccf0f86f0","name":"php-redis","state":"Success","kind":"container","success":true,"nodeName":"cn-hangzhou.192.168.0.204"}]}}
```

销毁实验：

```
blade destroy 092e8b4d88d4f449
```

