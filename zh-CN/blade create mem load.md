# blade create mem load
内存占用

## 介绍
内存占用


## 参数
```text
--mem-percent string    内存使用率，取值是 0 到 100 的整数
--timeout string   设定运行时长，单位是秒，通用参数
```

## 案例
```text
# 在执行命令之前，先使用 top 命令查看内存使用信息，如下，总内存大小是 8G，使用了 7.6%
KiB Mem :  7.6/8010196  

# 执行内存占用 50%
blade c mem load --mem-percent 50

# 查看内存使用
KiB Mem : 50.0/8010196 

# 执行内存占用 100%
KiB Mem : 99.6/8010196
```

## 实现原理
待补充

## 常见错误
Q：如果执行了内存满载，无法恢复，如何处理
A：重启机器恢复