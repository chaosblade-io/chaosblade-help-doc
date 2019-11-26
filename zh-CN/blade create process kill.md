# blade create process kill
杀进程

## 介绍
此实验会强制杀掉进程。支持命令行或者命令中进程匹配。

此实验可以验证程序的自愈能力，或者服务进程不存在时，系统的容错能力。


## 参数
```text
--process string       进程关键词，会在整个命令行中查找
--process-cmd string   进程命令，只会在命令中查找
--timeout string   设定运行时长，单位是秒，通用参数
```

## 案例
```text
# 删除包含 SimpleHTTPServer 关键词的进程
blade create process kill --process SimpleHTTPServer

# 删除 java 进程
blade create process kill --process-cmd java
```

## 实现原理
--process 内部使用 ps -ef | grep KEY 查找；--process-cmd 内部使用 pgrep 命令查找。使用 kill -9 PIDS 杀死进程。

## 常见问题
Q：杀死的进程能否恢复
A：blade 命令不能恢复杀掉的进程
