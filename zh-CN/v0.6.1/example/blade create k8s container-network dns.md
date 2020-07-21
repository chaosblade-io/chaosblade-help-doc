指定 default 命名空间下 Pod 名为 frontend-d89756ff7-pbnnc，容器id为 2ff814b246f86，做访问 www.baidu.com 域名异常实验举例。

**yaml 配置方式** 

```yaml
apiVersion: chaosblade.io/v1alpha1
kind: ChaosBlade
metadata:
  name: tamper-container-dns-by-id
spec:
  experiments:
  - scope: container
    target: network
    action: dns
    desc: "tamper container dns by id"
    matchers:
    - name: container-ids
      value:
      - "4b25f66580c4"
    - name: domain
      value: ["www.baidu.com"]
    - name: ip
      value: ["10.0.0.1"]
      # pod names
    - name: names
      value: ["frontend-d89756ff7-trsxf"]
      # or use pod labels
```

例如配置好文件后，保存为 tamper_container_dns_by_id.yaml，使用以下命令执行实验场景：

 ```
 kubectl apply -f tamper_container_dns_by_id.yaml
 ```

 可通过以下命令查看每个实验的执行状态：

 ```
 kubectl get blade tamper_container_dns_by_id.yaml -o json
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
        "name": "tamper-container-dns-by-id",
        "resourceVersion": "9435600",
        "selfLink": "/apis/chaosblade.io/v1alpha1/chaosblades/tamper-container-dns-by-id",
        "uid": "137372c2-ff7c-11e9-8883-00163e0ad0b3"
    },
        "status": {
        "expStatuses": [
            {
                "action": "dns",
                "resStatuses": [
                    {
                        "id": "1141530f66869a82",
                        "kind": "container",
                        "name": "php-redis",
                        "nodeName": "cn-hangzhou.192.168.0.203",
                        "state": "Success",
                        "success": true,
                        "uid": "4b25f66580c4dbf465a1b167c4c6967e987773442e5d47f0bee5db0a5e27a12d"
                    }
                ],
                "scope": "container",
                "state": "Success",
                "success": true,
                "target": "network"
            }
        ],
        "phase": "Running"
    }
}
 ```

 可以登录容器访问 www.baidu.com 域名进行验证

使用以下命令停止实验：

```
kubectl delete -f tamper_container_dns_by_id.yaml 
```

**blade 命令执行方式**

```shell
blade create k8s container-network dns --domain www.baidu.com --ip 10.0.0.1 --names frontend-d89756ff7-trsxf --namespace default --container-ids 4b25f66580c4 --kubeconfig config 
```

如果执行失败，会返回详细的错误信息；如果执行成功，会返回实验的 UID：

```
{"code":200,"success":true,"result":"6e46a5df94e0b065"}
```

可通过以下命令查询实验状态：

```
blade query k8s create 6e46a5df94e0b065 --kubeconfig config

{"code":200,"success":true,"result":{"uid":"6e46a5df94e0b065","success":true,"error":"","statuses":[{"id":"90304950e52d679e","uid":"4b25f66580c4dbf465a1b167c4c6967e987773442e5d47f0bee5db0a5e27a12d","name":"php-redis","state":"Success","kind":"container","success":true,"nodeName":"cn-hangzhou.192.168.0.203"}]}}
```

销毁实验：

```
blade destroy 6e46a5df94e0b065
```