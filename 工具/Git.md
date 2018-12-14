### 一.IDEA提交代码步骤

第一步：在提交项目之前必须先对项目进行更新，此项特别重要，如果不进行更新，别人有项目提交到服务器上，那么你的项目将会提交不上去，使用git解决冲突会比较麻烦，即使你解决了冲突，但是有时候不注意会冲掉别人写的代码，不像svn使用那么简单，所以提交自己项目前必须进行更新（特别重要）；如图1：选择pull进行更新代码操作；![img](https://img-blog.csdn.net/20171120192006829?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

第二步：更新后的结果如图2、3；其中图2：表示从服务器上更新下来的代码；图3：表示服务器上没有需要更新的代码，当服务器上没有需要更新到本地的代码时，则可以放心的进行提交代码的操作；

![img](https://img-blog.csdn.net/20171120192417714?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

![img](https://img-blog.csdn.net/20171120192446634?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

第三步：1.当确定第二步操作完之后，此时可以进行提交代码的操作，图4中表示中红色的项目表示新创建的项目{注：如果是蓝色，表示修改过的项目}（红色和蓝色都表示待提交项目），如果是红色的，则选择图5：add,如果项目是蓝色，则选择图5.1 ：commit file;

![img](https://img-blog.csdn.net/20171120192659004?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

![img](https://img-blog.csdn.net/20171120193357463?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

2.当add操作完成之后项目颜色会变成绿色，如图6，红色表示为进行add操作；

![img](https://img-blog.csdn.net/20171120193700879?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

3.进行commit Directory操作 如图7：![img](https://img-blog.csdn.net/20171120193846925?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

4.当出现如图8的窗口时，绿色和蓝色表示待提交项目，在这里可以进行相应的勾选，下面的commit message区域填写，模块名称或者提交代码的相应信息，下面的下拉菜单选择commit and push,如红色8区域；![img](https://img-blog.csdn.net/20171120194127109?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

5.如图9：当出现下面窗口时，选择红色区域9部分的push按钮，进行提交项目操作，至此项目提交所以操作完成，需要等几秒钟会有相应提交成功或者是提交失败的提示，如果提交失败则表示，你本地项目没有进行更新，和服务器上的项目有冲突，需要解决冲突，然后才能提交(注：当pull失败时，说明服务器上的代码和本地代码有冲突，这时则需要把本地有冲突的代码备份，然后还原，再pull，这时pull成功后，再把自己备份的代码部分，拷入相应的代码中，这时候再进行push就可以了)。

![img](https://img-blog.csdn.net/20171120195312180?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

第四还原操作：如图选择10区域按钮：revert进行还原操作；

![img](https://img-blog.csdn.net/20171120195941337?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ2VuZzMx/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

### 二.git pull - -rebase

在开始对比这两条命令之前，请大家思考三个问题：

> 1 工作区不干净（没有git add .）可以git pull或者git pull - -rebase代码吗？

![这里写图片描述](https://img-blog.csdn.net/20171214221753192?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

![这里写图片描述](https://img-blog.csdn.net/20171214221855565?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

> 结果是不可以，如果你没有将修改提交到暂存区，那么无论是pull还是pull –rebase都是不可以拉下来代码的

接下来我们再多思考下：

> 2 如果工作区修改提交到暂存区但是没有commit可以调用git pull和git pull - -rebase命令吗？



![这里写图片描述](https://img-blog.csdn.net/20171214222405966?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

综上所述我们的结论是：

> 工作区不commit是无法pull代码的

接下来看push命令：

3 如果工作区修改没有add可以调用git push命令吗？



 ![这里写图片描述](https://img-blog.csdn.net/20171214235001501?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

 > 4 如果工作区修改没有commit可以调用git push命令吗？

 ![这里写图片描述](https://img-blog.csdn.net/20171214235106086?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

 综上所述我们的结论是：
 > 工作区不commit是无法push代码的

根据上面的结论我们知道必须commit才可以push和pull代码（也就是说必须有结点才可以pull/push代码）看图我们来分析git pull和git pull - -rebase的区别:

![这里写图片描述](https://img-blog.csdn.net/20171214225847736?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

> 1 远程分支为dev分支,本地分支叫work，当我们从dev分支1拉取到本地的时候，两个分支的起始状态都是1
>
> 2 这个时候我们本地分支修改了3，而dev分支其他人推送了2,这个时候就出现了一个问题，我们该如何拉取代码呢？

**思路：**

> 1 假如dev分支没有更改，本地分支上一个结点就是dev分支最新结点

![这里写图片描述](https://img-blog.csdn.net/20171215105651414?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

那么pull下来的代码最新的结点还是2结点，所以push上去的时候dev最新的结点是2结点

> 2 假如dev分支有了更改，本地分支上一个结点不再是dev分支最新结点

![这里写图片描述](https://img-blog.csdn.net/20171215110156640?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

那么本地分支会新产生一个结点（内部新commit了一个结点，就是我们经常看到的Merge branch**,这个时候本地分支的结点就是1-3-4，push上去的时候dev分支就是1-2-4），这个结点是2和3 merge之后的结果

![这里写图片描述](https://img-blog.csdn.net/20171215111256619?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

rebase=re+base,我把他翻译成“重新定义基点，简称重定基”，本地分支最新的结点本来是3，但是我使用git pull –rebase的时候把3修改先隐藏，让本地分支的最新结点变成远端的2结点，再在2结点的基础上增加3结点，这样push的时候dev分支就是3结点而不是merge结点了，这样就可以让我们的所有提交保持成一条线而不是很多merge

![这里写图片描述](https://img-blog.csdn.net/20171215111643271?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

**confilct处理：**

无论是pull还是rebase，当同一个文件被其他人改动之后就会出现冲突，rebase只能做到不出现merge结点但是和pull一样遇到冲突需要自行解决

**git pull遇到冲突**

这个时候遇到的冲突比较常见，我们一般是手动修改冲突之后再add,commit，push没有什么好讲的了

**git pull –rebase遇到冲突**

![这里写图片描述](https://img-blog.csdn.net/20171215115611783?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

> 先进入冲突的文件，解决之后使用 add 或者 rm<文件>,之后直接 git rebase –continue即可（注意不用commit，使用add <文件名>而不是add .）

![这里写图片描述](https://img-blog.csdn.net/20171215115854166?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvTG9zaW5nQ2FycnlKaWU=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)

最后如何把让我们使用git pull做git pull –rebase的操作呢？

**配置**

如果想要把 rebase 当做 git pull 的默认值，可以在 .git/config 加上 
[branch “master”] 
remote = origin 
merge = refs/heads/master 
rebase = true 
也可以直接加到 ~/.gitconfig 让所有的 tracked branches 都自动套用这个设定： 
[branch] 

autosetuprebase = always