# postman

### postman模拟数组

方式一

post请求,选择body,选择form-data数据格式如下

| Key        | Value |
| ---------- | ----- |
| storyIds[] | 819   |
| storyIds[] | 818   |

springmvc接收

```java
 public ExecuteResult batchDeleteStory(@RequestParam(value="storyIds[]") Integer[] storyIds, HttpServletRequest request) {}
```

方式二


