# blade create disk fill
磁盘填充混沌实验

## 介绍
模拟磁盘填充，可以指定填充的目录和填充大小。

验证磁盘满下对系统服务的影响，比如监控告警、服务稳定性等。

## 参数
```text
--path string      需要填充的目录，默认值是 /
--size string      需要填充的文件大小，单位是 M，取值是整数，例如 --size 1024 (必要参数)
--timeout string   设定运行时长，单位是秒，通用参数
```
      
## 案例
```text
# 执行实验之前，先看下 /home 所在磁盘的大小
df -h /home

Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        40G  4.0G   34G  11% /

# 执行磁盘填充，填充 40G，即达到磁盘满的效果（可用34G）
blade create disk fill --path /home --size 40000

# 返回结果
{"code":200,"success":true,"result":"7a3d53b0e91680d9"}

# 查看磁盘大小
df -h /home

Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        40G   40G     0 100% /

# 销毁实验
blade destroy 7a3d53b0e91680d9

{"code":200,"success":true,"result":"command: disk fill --debug false --help false --path /home --size 40000"}

# 查看磁盘大小
df -h /home

Filesystem      Size  Used Avail Use% Mounted on
/dev/vda1        40G  4.0G   34G  11% /
```

## 实验原理
待补充

## 场景问题