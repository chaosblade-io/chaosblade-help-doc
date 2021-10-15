# blade create  --b-params http/dubbo --b-params 
## 介绍
本场景主要模拟 Java http/dubbo 接口调用场景中需要根据业务数据匹配注入条件的情况。
通过从rpc中间件或者通过spi获取业务数据与b-params中配置的业务数据进行匹配，匹配成功才命中规则。


## 参数介绍
	
```

b-params 格式为json，支持三个字段mode、key、value。
mode：取值有两种：rpc、spi；rpc代表在http header或者dubbo invocation 中获取业务数据，spi代表通过业务spi实现获取业务数据。
key：1)在rpc模式中代表业务数据的获取路径。举例：busidata.userinfo.userid 。第一层代表http header key值，第二、三层分表代表此header value值对应的字符串转换成json后的路径。伪代码表示：
    String busiData =  header.get("busidata");
    String userID = JsonObject.fromString(busiData).get("userinfo.userid");
    2)在spi模式中代表spi实现获取业务数据的关键字。
value：表示匹配值。

```

## 案例1(rpc)
在http header中获取业务数据
```
    @GetMapping("/bparms/rpc")
    @ResponseBody
    @LoginCheck(value = false)
    public String testResttemplate() throws IOException {
        RestTemplate restTemplate = new RestTemplate();
        //指定header
        HttpHeaders headers = new HttpHeaders();
        Map<String, Object> dataMap = new HashMap<>();
        Map<String, Object> userInfoMap = new HashMap<>();
        userInfoMap.put("userid", "u123456");
        dataMap.put("userinfo", dataMap);
        String data = JsonUtil.obj2Json(dataMap);
        headers.set("busidata", data);
        HttpEntity httpEntity = new HttpEntity(headers);
        ResponseEntity<String> responseEntity = restTemplate.exchange("http://127.0.0.1:8801/getName?name=friend", HttpMethod.GET, httpEntity, String.class);
        return responseEntity.getBody();
    }
```
注入命令
```
blade create http throwCustomException --exception=java.lang.Exception --uri=http://127.0.0.1:8801/getName?name=friend --effect-percent=100 --exception-message= --b-params='[{\"mode\":\"rpc\",\"key\":\"busidata.userinfo.userid\",\"value\":\"u123456\"}]' 
```


## 案例2(spi)
实现spi接口，从trace中通过配置的key获取业务数据
```
public class SPITest implements BusinessDataGetter {
    TraceClient traceClient = TraceClientGetter.getClient();

    @Override
    public String get(String key) throws Exception {
        return traceClient.getTraceContextByKey(key);
    }
}
```
注入命令
```
blade create http throwCustomException --exception=java.lang.Exception --uri=http://127.0.0.1:8801/getName?name=friend --effect-percent=100 --exception-message= --b-params='[{\"mode\":\"spi\",\"key\":\"userid\",\"value\":\"u123456\"}]' 
```
