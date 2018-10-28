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