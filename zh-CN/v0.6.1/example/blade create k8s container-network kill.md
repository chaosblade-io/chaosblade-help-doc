指定 default 命名空间下 Pod 名是 frontend-d89756ff7-tl4xl，容器id为 f1de335b4eeaf，进程名为 top 的进程。

**yaml 配置方式** 

```yaml
apiVersion: chaosblade.io/v1alpha1
kind: ChaosBlade
metadata:
  name: kill-container-process-by-id
spec:
  experiments:
  - scope: container
    target: process
    action: kill
    desc: "kill container process by id"
    matchers:
    - name: container-ids
      value:
      - "f1de335b4eeaf"
    - name: process
      value: ["top"]
    - name: names
      value: ["frontend-d89756ff7-tl4xl"]
```

例如配置好文件后，保存为 kill_container_process_by_id.yaml ，使用以下命令执行实验场景：

 ```
 kubectl apply -f kill_container_process_by_id.yaml 
 ```

 可通过以下命令查看每个实验的执行状态：

 ```
 kubectl get blade kill-container-process-by-id -o json
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
        "name": "kill-container-process-by-id",
        "resourceVersion": "9438733",
        "selfLink": "/apis/chaosblade.io/v1alpha1/chaosblades/kill-container-process-by-id",
        "uid": "a5a597be-ff7e-11e9-a8e2-00163e08a39b"
    },
    "status": {
        "expStatuses": [
            {
                "action": "kill",
                "resStatuses": [
                    {
                        "id": "10cdc57b9c80a9f0",
                        "kind": "container",
                        "name": "php-redis",
                        "nodeName": "cn-hangzhou.192.168.0.204",
                        "state": "Success",
                        "success": true,
                        "uid": "f1de335b4eeaf035b8d23a87080f3d24cebc803cbb6ad15e5fe0d8567e2e8939"
                    }
                ],
                "scope": "container",
                "state": "Success",
                "success": true,
                "target": "process"
            }
        ],
        "phase": "Running"
    }
}
 ```

使用以下命令停止实验：

```
kubectl delete -f kill_container_process_by_id.yaml 
```

注意，停止实验不会恢复已杀掉的进程！！

**blade 命令执行方式**

```shell
blade create k8s container-process kill --process top --names frontend-d89756ff7-tl4xl --container-ids f1de335b4eeaf --namespace default --kubeconfig config
```

如果执行失败，会返回详细的错误信息；如果执行成功，会返回实验的 UID：

```
{"code":200,"success":true,"result":"06d5ebae60e8fe3f"}
```

可通过以下命令查询实验状态：

```
blade query k8s create 06d5ebae60e8fe3f --kubeconfig config

{"code":200,"success":true,"result":{"uid":"06d5ebae60e8fe3f","success":true,"error":"","statuses":[{"id":"1000cbd2018e2c90","uid":"f1de335b4eeaf035b8d23a87080f3d24cebc803cbb6ad15e5fe0d8567e2e8939","name":"php-redis","state":"Success","kind":"container","success":true,"nodeName":"cn-hangzhou.192.168.0.204"}]}}
```

销毁实验：

```
blade destroy 06d5ebae60e8fe3f
```