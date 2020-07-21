# blade create pod IO

# **Introduction**
Pod File System IO Exception
# **Flags**

```
--method
	inject methods, only support read and write
--delay
	file io delay time, ms
--path
	I/O exception path or file
--random
	random inject I/O code
--percent
	I/O error percent [0-100],
--errno
	I/O error code
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

首先，通过deployment部署测试pod，并在pod的annotation里面指定需要注入I/O异常的volume以及子目录。

```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  labels:
    app: test
  name: test
  namespace: test
spec:
  replicas: 1
  selector:
    matchLabels:
      app: test
  template:
    metadata:
      annotations:
        chaosblade/inject-volume: data
        chaosblade/inject-volume-subpath: conf
      labels:
        app: test
    spec:
      containers:
      - command: ["/bin/sh", "-c", "while true; do sleep 10000; done"]
        image: busybox
        imagePullPolicy: IfNotPresent
        name: test
        volumeMounts:
        - mountPath: /data
          mountPropagation: HostToContainer
          name: data
      volumes:
      - hostPath:
          path: /data/fuse
        name: data
```

chaosblade webhook会根据pod的annotation，注入fuse的sidecar容器：

1. `chaosblade/inject-volume`指明需要注入故障的volume name，比如例子中的`data`
2. `chaosblade/inject-volume-subpath`指明volume挂载路径的子目录。上面的例子中，volume的挂载路径是`/data`,子目录是`conf`，则在pod内，注入I/O异常的目录是`/data/conf`。
3. 指定需要注入故障的volume需要指定`mountPropagation：HostToContainer`，这个字段的含义可以参考官方文档[Volumes](https://kubernetes.io/docs/concepts/storage/volumes/#mount-propagation)

通过上面的yaml文件创建deployment后，chaosblade webhook会自动插入sidecar容器：

```bash
kubectl get pod -n test
NAME                   READY   STATUS    RESTARTS   AGE
test-bc7786698-k6tb7   2/2     Running   0          3m40s
```

这时虽然插入了sidecar容器，但是还没有注入I/O异常，可以通过下面的yaml注入相关的I/O异常：

```yaml
apiVersion: chaosblade.io/v1alpha1
kind: ChaosBlade
metadata:
  name: inject-pod-by-labels
spec:
  experiments:
  - scope: pod
    target: pod
    action: IO
    desc: "Pod IO Exception by labels"
    matchers:
    - name: labels
      value:
      - "app=test"
    - name: namespace
      value:
      - "test"
    - name: method
      value:
      - "read"
    - name: delay
      value:
      - "1000"
    - name: path
      value:
      - ""
    - name: percent
      value:
      - "60"
    - name: errno
      value:
      - "28"
```

在这里例子中，我们对`read`操作注入两种异常，异常率为百分之60:

- 对`read`操作增加1s的延迟，支持的操作类型包括：

```
1. open
2. read
3. write
4. mkdir
5. rmdir
6. opendir
7. fsync
8. flush
9. release
10. truncate
11. getattr
12. chown
13. chmod
14. utimens
15. allocate
16. getlk
17. setlk
18. setlkw
19. statfs
20. readlink
21. symlink
22. create
23. access
24. link
25. mknod
26. rename
27. unlink
28. getxattr
29. listxattr
30. removexattr
31. setxattr
```

- 对`read`操作返回错误`28`，支持的错误码包括:

```
1: Operation not permitted
2: No such file or directory
5: I/O error
6: No such device or address
12: Out of memory
16: Device or resource busy
17: File exists
20: Not a directory
22: Invalid argument
24: Too many open files
28: No space left on device
```

当用上面的yaml文件注入I/O异常后，在pod内读取指定目录中的文件，发现返回了`No space left on device`，因为有重试，显示有`3s`的延迟。

```bash
kubectl exec  test-bc7786698-k6tb7 -c test -n test time cat /data/conf/file
cat: read error: No space left on device
Command exited with non-zero status 1
real    0m 3.00s
user    0m 0.00s
sys     0m 0.00s
```

