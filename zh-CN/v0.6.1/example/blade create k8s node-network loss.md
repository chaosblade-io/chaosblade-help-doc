对 cn-hangzhou.192.168.0.205 节点本地端口 40690 访问丢包率 60%

**yaml 配置方式**

```yaml
apiVersion: chaosblade.io/v1alpha1
kind: ChaosBlade
metadata:
  name: loss-node-network-by-names
spec:
  experiments:
  - scope: node
    target: network
    action: loss
    desc: "node network loss"
    matchers:
    - name: names
      value: ["cn-hangzhou.192.168.0.205"]
    - name: percent
      value: ["60"]
    - name: interface
      value: ["eth0"]
    - name: local-port
      value: ["40690"]
```

保存为 yaml 文件，比如 loss-node-network-by-names.yaml，使用 kubectl 命令执行：

```
kubectl apply -f loss-node-network-by-names.yaml
```

实验状态查询：

```
kubectl get blade loss-node-network-by-names -o json
```

返回结果如下(省略了一部分)：

```
~ » kubectl get blade loss-node-network-by-names -o json                                                            
{
    "apiVersion": "chaosblade.io/v1alpha1",
    "kind": "ChaosBlade",
    "metadata": {
        "creationTimestamp": "2019-11-04T09:56:36Z",
        "finalizers": [
            "finalizer.chaosblade.io"
        ],
        "generation": 1,
        "name": "loss-node-network-by-names",
        "resourceVersion": "9262302",
        "selfLink": "/apis/chaosblade.io/v1alpha1/chaosblades/loss-node-network-by-names",
        "uid": "63a926dd-fee9-11e9-b3be-00163e136d88"
    },
        "status": {
        "expStatuses": [
            {
                "action": "loss",
                "resStatuses": [
                    {
                        "id": "057acaa47ae69363",
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
                "target": "network"
            }
        ],
        "phase": "Running"
    }
}
```

执行以下命令停止实验：

```
kubectl delete -f loss-node-network-by-names.yaml
```

或者直接删除 blade 资源：

```
kubectl delete blade loss-node-network-by-names
```

**blade 执行方式**

```
blade create k8s node-network loss --percent 60 --interface eth0 --local-port 40690 --kubeconfig config --names cn-hangzhou.192.168.0.205
```

如果执行失败，会返回详细的错误信息；如果执行成功，会返回实验的 UID：

```
{"code":200,"success":true,"result":"e647064f5f20953c"}
```

可通过以下命令查询实验状态：

```
blade query k8s create e647064f5f20953c --kubeconfig config

{"code":200,"success":true,"result":{"uid":"e647064f5f20953c","success":true,"error":"","statuses":[{"id":"fa471a6285ec45f5","uid":"e179b30d-df77-11e9-b3be-00163e136d88","name":"cn-hangzhou.192.168.0.205","state":"Success","kind":"node","success":true,"nodeName":"cn-hangzhou.192.168.0.205"}]}}
```

销毁实验：

```
blade destroy e647064f5f20953c
```