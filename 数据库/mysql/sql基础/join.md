# 			各种join从句

### SQL标准中join的类型

| 连接名称 |       语法       |
| :------: | :--------------: |
|  内连接  |    inner join    |
| 全外连接 | full outer join  |
| 左外连接 | left outer join  |
| 右外连接 | right outer join |
| 交叉连接 |    cross join    |

> outer可以省略 例如 left join

### inner join

内连接inner join基于连接谓词将两张表(如A,B)的列组合在一起,产生新的结果表,**取交集**

示例

``` sql
# Join操作的类型 —— Inner Join
SELECT
  a.user_name,
  a.over,
  b.over
FROM user1 a
  INNER JOIN user2 b ON a.user_name = b.user_name;
```

### full outer join

```sql
# Join操作的类型 —— Full Join
# 这种是将两个表中的数据都取出来,没有关联的地方为null,mysql中没有full join这种概念
# 错误示例
SELECT
	<select_list>
FROM
	TABLE A
	FULL JOIN TABLE B ON A.KEY = B.KEY
```

> mysql中没有full join这种概念

### left outer join

示例

```sql
# Join操作的类型 —— Left Join
# left join 左面的表为左表,右面的表为右表
# left join 是保留左表全部的数据,然后保留右表中与左表相关的数据
SELECT
	<select_list>
FROM
	TABLE A
	LEFT JOIN TABLE B ON A.KEY = B.KEY
	
# where B.KEY IS NULL 可以将 A,B相关的那部分去除掉,只剩下A独有的
# 使用这种方式可以避免使用 "not in","not in"是不会使用索引的
SELECT
	< select_list > 
FROM
	TABLE A
	LEFT JOIN TABLE B ON A.KEY = B.KEY 
WHERE
	B.KEY IS NULL
```



### right outer join

示例

```sql
# Join操作的类型 —— right Join
# right join 和 left join 是正好相反的,即保留右表全部数据,然后保留左表中与右表相关的数据
SELECT
	<select_list>
FROM
	TABLE A
	RIGHT JOIN TABLE B ON A.KEY = B.KEY
```



### cross join

```sql
# Join操作的类型 —— Cross Join
# 交叉连接,又名笛卡尔积连接,相当于把两个表相乘
SELECT
	<select_list>
FROM
	TABLE A
	Cross JOIN TABLE B
```

