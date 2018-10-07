# 		ElasticSearch for Java

因为是在springboot中使用的elasticsearch所以只能记录一下springboot中使用的经验,我认为在java中使用es一共有三步

- 第一步就是得到SearchRequestBuilder,示例如下

```java
SearchRequestBuilder srb = transportClient.prepareSearch("storyindexnew").setTypes("storynew");
```

- 第二步就是构建查询条件过滤器,可以通过QueryBuilders构建各种条件过滤器,示例如下

```java
BoolQueryBuilder fb = QueryBuilders.boolQuery();
fb.must(QueryBuilders.termQuery("id", "104207"));
```

- 第三步就是将过滤条件给SearchRequestBuilder,然后执行得到SearchResponse

```java
srb.setPostFilter(fb);
SearchResponse searchResponse = srb.execute().actionGet();
```



### TransportClient

springboot中整合ElasticSearch,TransportClient不需要创建直接引用就好,关于配置全部都在application.yml文件下,示例如下

```yml
uadmin:
  es:
    cluster: es-cluster
    sniff: true
    pingTimeout: 120s
    serverHost: 172.16.160.2
    port: 9300
```

### QueryBuilders

#### 术语级别查询

**term query**

在指定域里精确的查询包含指定词语的文档。

```java
QueryBuilder qb = termQuery(
    "name",    // 文档域的名称
    "kimchy"   // 要搜索的词
);

```

**terms query**

在指定域里精确的查询包含任一指定词语的文档。

```java
QueryBuilder qb = termsQuery("tags",    // 文档域的名称
    "blue", "pill");                    // 要搜索的词

```

**range query**

查询指定域的值（日期、数字或者字符串）在指定范围内的文档。

```java
QueryBuilder qb = rangeQuery("price")   // 文档域的名称
    .from(5)                            // 范围的开始
    .to(10)                             // 范围的结束
    .includeLower(true)                 // 包括范围的开始
    .includeUpper(false);               // 不包括范围的结束

```

**match query**

查询指定域的值 (日期、数字或者字符串) 在指定范围内的文档(不是精确查询是分词查询)

```java
QueryBuilders.matchQuery("product_name","");
```



**exists query**

查询指定域里有不是`null`值的所有文档。

```java
QueryBuilder qb = existsQuery("name");       // 文档域的名称

```

**prefix query**

查询所有指定域的值包含特定前缀的文档

```java
QueryBuilder qb = prefixQuery(
    "brand",    // 文档域的名称
    "heine"     // 前缀
);

```

**wildcard query**

查询所有指定域的值与通配符表达式匹配的文档。支持的通配符有单字符通配符`?`和多字符通配符`*`

```java
QueryBuilder qb = wildcardQuery("user", "k?mc*");

```

**regexp query**

查询所有指定域的值与正则表达式匹配的文档。

```java
QueryBuilder qb = regexpQuery(
    "name.first",        // 文档域的名称
    "s.*y");             // 正则表达式

```

**fuzzy query**

过时的，针对字符串域，它将会被移除而且没有替代功能

查询所有指定域的值与指定的术语相近的文档。模糊性是由Levenshtein（编辑距离算法）编辑距离1或者2来衡量。

```java
QueryBuilder qb = fuzzyQuery(
    "name",     // 文档域的名称
    "kimzhy"    // 搜索文本
);

```

**type query**

查询制定类型的所有文档

```java
QueryBuilder qb = typeQuery("my_type");

```

**ids query**
查询指定类型与ID的文档

```java
QueryBuilder qb = idsQuery("my_type", "type2")		//这里的type相当与表名
    .addIds("1", "4", "100");						//可变参可以传String[] 例如:.addIds(new 															String[]{"","",""})

QueryBuilder qb = idsQuery() // 类型是可选的
    .addIds("1", "4", "100");
```

#### 复合查询（Compound queries）

复合查询包装了其他复合或者叶子查询，用来合并它们的结果和分数，改变它们的行为，或者从查询切换到过滤器上下文。

本组有如下查询：

**constant_score query**

这个查询包裹了另一个查询，但是在过滤器上下文执行它。所有匹配的文档都会被赋予一个相同的`_score`。

```java
QueryBuilder qb = constantScoreQuery(
        termQuery("name","kimchy")      // 查询语句
    )
    .boost(2.0f);                       // 分数

```

**bool query**

默认的复合查询，具体有`must`, `should`, `must_not`, 或者`filter`从句。`must`和`should`从句会将它们的分数相加，越多的匹配条件分数越高。

```java
QueryBuilder qb = boolQuery()
    .must(termQuery("content", "test1"))    // must query
    .must(termQuery("content", "test4"))    
    .mustNot(termQuery("content", "test2")) // must not query
    .should(termQuery("content", "test3"))  // should query
    .filter(termQuery("content", "test5")); // 与一般查询作用一样，只不过不参与评分

```

**dis_max query**

这种查询接受多个子查询，并且返回所有子查询的结果。与bool query不同的是，它会使用最匹配子查询的分数。

```java
QueryBuilder qb = disMaxQuery()
    .add(termQuery("name", "kimchy"))        
    .add(termQuery("name", "elasticsearch")) 
    .boost(1.2f)                             
    .tieBreaker(0.7f);                       

```

## 五、搜索APIs

搜索API允许你执行一个搜索查询，并且取回查询匹配的数据，查询条件在后面的章节介绍。它可以被执行在1个或多个索引和类型上。这里有一个例子：

```
import org.elasticsearch.action.search.SearchResponse;
import org.elasticsearch.action.search.SearchType;
import org.elasticsearch.index.query.QueryBuilders.*;

SearchResponse response = client.prepareSearch("index1", "index2")
        .setTypes("type1", "type2")
        .setSearchType(SearchType.DFS_QUERY_THEN_FETCH)
        .setQuery(QueryBuilders.termQuery("multi", "test"))                 // Query
        .setPostFilter(QueryBuilders.rangeQuery("age").from(12).to(18))     // Filter
        .setFrom(0).setSize(60).setExplain(true) // 分页参数
        .get();
```