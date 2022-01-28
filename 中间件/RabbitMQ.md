---
typora-root-url: image
---

# RabbitMQ

##1.RabbitMQ核心概念

### 1.1为什么选择RabbitMQ

1. 开源、性能优秀，稳定性保障
2. 提供可靠性消息投递模式（`confirm`）、返回模式（`return`）
3. 与`SpringAMQP`完美的整合、API丰富
4. 集群模式丰富，表达式配置，HA模式(高可用模式)，镜像队列模式
5. 保证数据不丢失的前提下做到高可靠性、可用性

> `RabbitMQ`是一个开源的消息代理和队列服务器，用来通过普通协议在完全不同的应用之前共享数据(跨平台、跨语言)，`RabbitMQ`是使用`Erlang`语言编写的，并且`RabbitMQ`是基于`AMQP`协议的。

### 1.2RabbitMQ的高性能是如何实现的

因为`RabbitMQ`是使用`Erlang`语言开发的，`Erlang`语言最初用于交换机领域的架构模式，这样使得`RabbitMQ`在`Broker`之间进行数据交互的性能非常优秀

> `Erlang`的优点：`Erlang`有着和原生`Socket`一样的延迟

### 1.3什么是AMQP高级消息队列协议

AMQP定义：是具有现代特征的二进制协议。是一个提供统一消息服务的应用曾标准高级消息队列协议，是应用层协议的一个开放标准，为面向消息的中间件设计。



![5c760b690001c67819201080](/RabbitMQ/5c760b690001c67819201080.jpg)

>AMQP全称：Advanced Message Queuing Protocol
>
>AMQP翻译：高级消息队列协议
>
>其实AMQP就是一个上层的规范，里面定义了一些核心概念，基于规范可以开发出RabbitMQ以及其他MQ(message queue)

### 1.4AMQP核心概念是什么

1. Server：又称Broker(代理)，接受客户端的连接，实现AMQP实体服务
2. Connection：连接，应用程序与Broker的网络连接
3. Channel：网络信道，几乎所有的操作都在Channel中进行，Channel是进行消息读写的通道。客户端可建立多个Channel，每个Channel代表一个会话任务
4. Message：消息，服务器和应用程序之间传送的数据，由Properties和Body组成。Properties可以对消息进行修饰，比如消息的优先级、延迟等高级特性；Body则就是消息体内容。
5. Virtual host：虚拟地址，用于进行逻辑隔离，最上层的消息路由。一个Virtual Host里面可以有若干个Exchange和Queue，
   同一个VirtualHost里面不能有相同名称的Exchange或Queue
6. Exchange: 交换机，接收消息，根据路由键转发消息到绑定的队列
7. Binding: Exchange和Queue之间的虚拟连接,binding中可以包含routing key
8. Routing key:一个路由规则，虚拟机可用它来确定如何路由一个特定消息
9. Queue：也称为Message Queue，消息队列，保存消息并将它们转发给消费者

### 1.5RabbitMQ的整体架构模型

### 1.6RabbitMQ消息流转

### 1.7命令台与管控台

rabbitmqctl stop_app：关闭应用

rabbitmqctl start_app：启动应用

rabbitmqctl status：节点状态

rabbitmqctl add_user `username` `password`：添加用户

rabbitmqctl list_users：列出所有用户

rabbitmqctl delete_user `username`：删除用户

rabbitmqctl clear_permissions -p `vhostpath` `username`：清除用户权限

rabbitmqctl list_exchanges：列出所有交换机

rabbitmqctl add_vhost `vhostpath`：创建虚拟主机

rabbitmqctl list_vhosts：列出所有虚拟主机

rabbitmqctl list_permissions -p `vhostpath`：列出虚拟主机上所有的权限

rabbitmqctl list_queues：查看所有队列信息

rabbitmqctl -p `vhostpath` purge_queue `queue_name`：清除队列里的消息

rabbitmqctl reset: 移除所有数据，要在rabbitmqctl stop_app之后使用

rabbitmqctl join_cluster `<clusternode>` [--ram]：组成集群命令

rabbitmqctl cluster_status：查看集群状态

rabbitmqctl change_cluster_node_type disc l ram：修改集群节点的存储形式

rabbitmqctl forget_cluster_node [--offline] ：忘记节点（摘除节点）

rabbitmqctl rename_cluster_node oldnode1 newnode1 [oldnode2]
[newnode2 ...] ：修改节点名称

>  ps -ef | grep rabbit 
>
>  ps aux|grep epmd
>
> rabbitmq-server start &

### 1.8RabbitMQ消息生产与消费

生产者消费者模型构建步骤：

1. Connection：一个连接
2. Channel：数据通信信道，可发送和接收消息
3. Queue：具体的消息存储队列
4. Producer & Consumer：生产和消费者

### 1.9RabbitMQ交换机详解

交换机属性：

1. Name：交换机名称
2. Type：交换机类型 direct、topic、fanout、headers
3. Durability：是否需要持久化， true为持久化
4. Auto Delete：当最后一个绑定到Exchange上的队列删除后，自动删除该Exchange
5. Internal：当前Exchange是否用于RabbitMQ内部使用，默认为false



### 1.10RabbitMQ队列、绑定、虚拟主机、消息