# blade create docker mem

## 介绍
容器内 MEM 负载实验场景，同基础资源的 MEM 场景

## 命令
支持 MEM 场景命令如下：
* `blade create docker mem load` 容器内 MEM 负载场景，同 [blade create mem load](blade create mem load.md)

## 参数
除了上述基础场景各自所需的参数外，在 docker 环境下，还支持的参数如下：
```
--blade-override           是否覆盖容器内已有的 chaosblade 工具，默认是 false，表示不覆盖，chaosblade 在容器内的部署路径为 /opt/chaosblade
--blade-tar-file string    指定本地 chaosblade-VERSION.tar.gz 工具包全路径，用于拷贝到容器内执行
--container-id string      目标容器 ID
--docker-endpoint string   Docker server 地址，默认为本地的 /var/run/docker.sock
```

## 案例
对 container id 是 0d7c0e6331e9 的做 MEM 使用率 80% 的实验场景，执行命令如下：
```
 blade create docker mem load --mode ram --mem-percent 80 --blade-tar-file /root/chaosblade-0.4.0.tar.gz --container-id 0d7c0e6331e9
```

执行成功会返回 `{"code":200,"success":true,"result":"bc45a204e1089eab"}`

执行命令前使用```docker stats 0d7c0e6331e9```命令查看容器内存使用率:
```
CONTAINER ID        NAME                 CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
0d7c0e6331e9        k8s_daoa20a8552670   0.00%               3.727MiB / 1GiB     0.36%               0B / 0B             0B / 0B             3
```

执行命令后使用```docker stats 0d7c0e6331e9```命令验证查看容器内存使用率:
```
CONTAINER ID        NAME                 CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
0d7c0e6331e9        k8s_daoa20a8552670   0.16%               866.7MiB / 1GiB     84.64%              0B / 0B             0B / 0B             20
```

销毁实验执行以下命令：
```
blade destroy bc45a204e1089eab
```

## 常见问题
Q: 执行报如下错误：{"code":801,"success":false,"error":"\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0002\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0002\u0000\u0000\u0000\u0000\u0000\u0000Omv: cannot stat '/opt/chaosblade-0.4.0.linux-amd64': No such file or directory"}
A：需要修改将 chaosblade-0.4.0.linux-amd64.tar.gz 包名改为 chaosblade-VERSION.tar.gz 格式，即此处改为 chaosblade-0.4.0.tar.gz

Q: 执行报如下错误：
{"code":801,"success":false,"error":"\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u0000\u0002\u0000\u0000\u0000\u0000\u0000\u0000\u0000"}
A：重试即可 


## 兜底方案
登录容器，kill 掉 chaos_burncpu 进程即可，或者主机上执行