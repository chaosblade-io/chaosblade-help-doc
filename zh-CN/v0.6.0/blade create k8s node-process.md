# blade create k8s node-process

## 介绍
kubernetes 节点进程相关场景，同基础资源的进程场景

## 命令
支持的进程场景命令如下：
* `blade create k8s node-process kill` 杀节点上指定进程，同 [blade create process kill](blade create process kill.md)
* `blade create k8s node-process stop` 挂起节点上指定进程，同 [blade create process stop](blade create process stop.md)

## 参数
除了上述基础场景各自所需的参数外，在 kubernetes 环境下，还支持的参数如下：
```
--evict-count string     限制实验生效的数量
--evict-percent string   限制实验生效数量的百分比，不包含 %
--labels string          节点资源标签
--names string           节点资源名，多个资源名之间使用逗号分隔
--kubeconfig string      kubeconfig 文件全路径（仅限使用 blade 命令调用时使用）
--waiting-time string    实验结果等待时间，默认为 20s，参数值要包含单位，例如 10s，1m
```

## 案例
杀指定 cn-hangzhou.192.168.0.205 节点上 redis-server 进程

**yaml配置方式如下**
```yaml
apiVersion: chaosblade.io/v1alpha1
kind: ChaosBlade
metadata:
  name: kill-node-process-by-names
spec:
  experiments:
  - scope: node
    target: process
    action: kill
    desc: "kill node process by names"
    matchers:
    - name: names
      value: ["cn-hangzhou.192.168.0.205"]
    - name: process
      value: ["redis-server"]
```

可以看到执行前后，redis-server 的进程号发生改变，说明被杀掉后，又被重新拉起
```
# ps -ef | grep redis-server
19497 root      2:05 redis-server *:6379

# ps -ef | grep redis-server
31855 root      0:00 redis-server *:6379
```

通过 `kubectl get blade kill-node-process-by-names -o json` 可以查看详细的执行结果(下发只截取部分内容)
```json
{
    "apiVersion": "v1",
    "items": [
        {
            "apiVersion": "chaosblade.io/v1alpha1",
            "kind": "ChaosBlade",
            "metadata": {
                "finalizers": [
                    "finalizer.chaosblade.io"
                ],
                "generation": 1,
                "name": "kill-node-process-by-names",
                "resourceVersion": "9421288",
                "selfLink": "/apis/chaosblade.io/v1alpha1/chaosblades/kill-node-process-by-names",
                "uid": "24aed084-ff70-11e9-8883-00163e0ad0b3"
            },
            "status": {
                "expStatuses": [
                    {
                        "action": "kill",
                        "resStatuses": [
                            {
                                "id": "ebe34959424fb022",
                                "kind": "node",
                                "name": "cn-hangzhou.192.168.0.205",
                                "nodeName": "cn-hangzhou.192.168.0.205",
                                "state": "Success",
                                "success": true,
                                "uid": "e179b30d-df77-11e9-b3be-00163e136d88"
                            }
                        ],
                        "scope": "node",
                        "state": "Success",
                        "success": true,
                        "target": "process"
                    }
                ],
                "phase": "Running"
            }
        }
    ],
}
```

执行以下命令停止实验：
```
kubectl delete -f kill_node_process_by_names.yaml
```
或者直接删除 blade 资源：
```
kubectl delete blade kill-node-process-by-names
```

**blade 执行方式**
```
blade create k8s node-process kill --process redis-server --names cn-hangzhou.192.168.0.205 --kubeconfig config
```
如果执行失败，会返回详细的错误信息；如果执行成功，会返回实验的 UID：
```
{"code":200,"success":true,"result":"fc93e5bbe4827d4b"}
```
可通过以下命令查询实验状态：
```
blade query k8s create fc93e5bbe4827d4b --kubeconfig config

{"code":200,"success":true,"result":{"uid":"fc93e5bbe4827d4b","success":true,"error":"","statuses":[{"id":"859c56e6850c1c1b","uid":"e179b30d-df77-11e9-b3be-00163e136d88","name":"cn-hangzhou.192.168.0.205","state":"Success","kind":"node","success":true,"nodeName":"cn-hangzhou.192.168.0.205"}]}}
```
销毁实验：
```
blade destroy fc93e5bbe4827d4b
```

## 常见问题
其他问题参考 [blade create k8s](blade create k8s.md) 常见问题
