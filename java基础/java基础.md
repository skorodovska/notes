# 								`java`基础



## 方法的重写

1. 重写：子类继承父类以后，可以对父类中同名同参数的方法，进行覆盖操作

2. 应用：重写以后，当创建子类对象以后，通过子类对象调用子父类中的同名同参数的方法时，实执行的是子类重写父类的方法。

3. 重写的规定：

   ```java
   方法的声明： 权限修饰符 返回值类型 方法名(形参列表）throws 异常的类型{
   //方法体
   }
   ```

   约定俗称：子类中的叫重写的方法，父类中的叫被重写的方法

   - 子类重写的方法的方法名和形参列表与父类被重写的方法的方法名和形参列表相同
   - 子类重写的方法的权限修饰符不小于父类被重写的方法的权限修饰符
     - 特殊情况：子类不能重写父类中声明为private权限的方法
   - 返回值类型：
     - 父类被重写的方法的返回值类型是void，则子类重写的方法的返回值类型只能是void
     - 父类被重写的方法的返回值类型是A类型，则子类重写的方法的返回值类型可以是A类或A类的子类
     - 父类被重写的方法的返回值类型为基本数据类型(例如：int)，则子类重写方法的返回值类型必须是相同的基本数据类型(必须也是int)
   - 子类重写的方法抛出的异常不大于父类被重写方法抛出的异常类型

   >
   >子类和父类的同名同参数的方法要么声明为非static的(考虑重写)，要么都声明为非static的(不考虑重写)

## super关键字

在继承关系中，子类会自动继承父类中定义的方法，但有时在子类中需要对继承的方法进行一些修改，即对父类的方法进行重写。需要注意的是，在子类中重写的方法需要和父类被重写的方法具有相同的方法名、参数列表以及返回值类型。

当子类重写父类的方法后，子类对象将无法访问父类被重写的方法，为了解决这个问题，在Java中专门提供了一个**super关键字用于子类访问父类的成员**。例如访问父类的**属性**、**方法**和**构造器**。

1. 我们可以在子类的方法或构造器中。通过使用"super.属性"或"super.方法"的方式，显式的调用父类中声明的属性或方法。但是，通常情况下，我们习惯省略"super."
2. 属性：当子类和父类中定义了同名的属性时，我们要想在子类中调用父类中声明的属性，则必须显式的
   使用"'super.属性"的方式，表明调用的是父类中声明的属性。(正常情况下不要在子父类中定义同名属性，可以描述的清楚些，进行区分，还有一个重要的原因是属性一般被`private`修饰，这样就不存在继承关系)
3.  方法：当子类重写了父类中的方法以后，我们想在子类的方法中调用父类中被重写的方法时，则必须显式的
   使用"super.方法"的方式，表明调用的是父类中被重写的方法。
4. 构造器：

   - 我们可以在子类的构造器中显式的使用"super(形参列表)"的方式，调用父类中声明的指定的构造器
   - "super(形参列表)"的使用，必须声明在子类构造器的首行！
   - 我们在类的构造器中，针对于"this(形参列表）"或"super(形参列表）"只能二选一，不能同时出现
   - 在构造器的首行，没有显式的声明"this(形参列表）"或"super(形参列表）"，则默认调用的是父类中空参的构造器：super()
   - 在类的多个构造器中，至少有一个类中的构造器使用了"super(形参列表)"，调用父类中的构造器，因为内存中是先加载父类再加载子类


> 类的构造器中至少有一个构造器使用了"super(形参列表)"，也就是说如果有N个构造器最多有N-1个构造器调用"'this(形参列表)"不可能所有的构造器都使用"this(形参列表)"，因为这样会导致构造器循环调用

## 子类对象实例化过程

1. 从结果上来看：（继承性）
   子类继承父类以后，就获取了父类中声明的属性或方法。创建子类的对象，在堆空间中，就会加载所有父类中声明的属性
2. 从过程上来看：
   当我们通过子类的构造器创建子类对象时，我们一定会直接或间接的调用其父类的构造器，进而调用父类的父类的构造器直到调用了`java.lang.Object`类中空参的构造器为止。正因为加载过所有的父类的结构，所以才可以看到内存中有父类中的结构，子类对象才可以考虑进行调用。

> 虽然创建子类对象时，调用了父类的构造器，但是自始至终就创建过一个对象，即为new的子类对象

## 多态

1. 理解多态性：可以理解为一个事物的多种形态
2. 何为多态性：

   - 对象的多态性：父类的引用指向子类的对象（或者子类的对象赋给父类的引用）
3. 多态的使用：虚拟方法调用

   - 子类中定义了与父类同名同参数的方法，在多态情况下，将此时父类的方法称为虚拟方法，父类根据赋给它的不同子类对象，动态调用属于子类的该方法。这样的方法调用在编译期是无法确定的

   - 有了对象的多态性以后，我们在编译期，只能调用父类中声明的方法，但在运行期，我们实际执行的是子类重写父类的方法。
     总结：编译，看左边；运行，看右边
4. 多态性的使用前提：

   - 类的继承关系
   - 方法的重写
5. 对象的多态性，只适用于方法，不适用于属性（编译和运行都看左边）
6. 不能调用子类特有的方法
6. 多态是编译时行为还是运行时行为？答：运行时行为，因为执行哪个子类的方法在编译期是确定不了的

## 重载和重写区别（编译和运行角度）

1. 重载，是指允许存在多个同名方法，而这些方法的参数不同。编译器根据方法不同的参数表，对同名方法的名称做修饰。对于编译器而言，这些同名方法就成了不同的方法。它们的调用地址在编译期就绑定了。Java的重载是可以包括父类和子类的，即子类可以重载父类的同名不同参数的方法。所以：对于重载而言，在方法调用之前，编译器就已经确定了所要调用的方法，这称为“早绑定”或“静态绑定”
2. 而对于多态，只有等到方法调用的那一刻，解释运行器才会确定所要调用的具体方法，这称为“晚绑定”或“动态绑定“

## instanceof操作符

```java
Person p1 = new Man();
Person p2 = new Woman();
//调用Man类特有的方法报错
p1.earnMoney();
//强转后不报错
Man man = (Man)p1;
man.earnMoney();
```

分析：有了对象的多态性以后，内存中实际上是加载了子类特有的属性和方法的，但是由于变量声明为父类类型，导致编译时，只能调用父类中声明的属性和方法。子类特有的属性和方法不能调用，可以使用强制类型转换符向下转型`Man man = (Man)p1;`

a instanceof A：判断对象a是否是类A的实例，如果是返true；如果不是返回false。

使用情境：为了避免在向下转型时出现ClassCastException的异常，我们在向下转型之前，先进行instanceof的判断，一旦返回true，就进行向下转型。如果返回false，不进行向下转型。

## static

static关键词的使用

1. static：静态的

2. static可以用来修饰：属性、方法、代码块、内部类

3. 使用static修饰属性：静态变量（或类变量）

   1. 属性，按照是否使用static修饰，分为静态变量 VS 非静态变量（实例变量）

      1. 非静态变量：我们创建了类的多个对象，每个对象都独立的拥有一套类中的非静态变量，当修改其中一个对象的非静态变量时，不会导致其他对象中同样的属性值修改。
      2. 静态变量：我们创建了类的多个对象，多个对象共享同一个静态变量，当通过某一个对象修改静态变量时，会导致其他对象调用此对象时，静态变量是修改过了的。

   2. static修饰属性的其他说明

      1. 静态变量随着类的加载而加载，可以通过”类.静态变量“的方式进行调用。

      2. 静态变量的加载要早于对象的创建。

      3. 由于类只加载一次，则静态变量在内存中也只会存在一份，存在方法区的静态域中。

      4. |      | 类变量 | 实例变量 |
         | ---- | ------ | -------- |
         | 类   | yes    | no       |
         | 对象 | yes    | yes      |

   3. 静态属性举例

      1. `System.out`
      2. `Math.PI`

4. 使用static修饰方法：静态方法

   1. 随着类的加载而加载，可以通过“类.方法”的方式调用

   2. 静态方法中只能调用静态的方法或属性，非静态方法中，既可以调用静态属性或方法，也可以调用非静态属性或方法

   3. |      | 静态方法 | 非静态方法 |
      | ---- | -------- | ---------- |
      | 类   | yes      | no         |
      | 对象 | yes      | yes        |

5. static注意点

   1. 在静态方法内，不可以使用this关键字、super关键字。
   2. 关于静态属性和静态方法的使用，大家都从生命周期的角度来理解。

6. 开发中，如何确定一个属性是否要声明为static的？

   1. 属性是可以被多个对象共享的，不会随着对象不同而不同的。

7. 开发中，如何确定一个方法是否要声明为static的？

   1. 操作静态属性的方法，通常设置为static的。
   2. 工具类中的方法，习惯上声明为static的，因为没有必要创建对象

## 单例设计模式

1. 所谓类的单例设计模式，采用一定的方法保证在整个的软件系统中，对某个类只能存在一个对象实例

2. 如何实现？

   1. 饿汉式：
      1. 坏处：对象声明周期时间过长
      2. 好处：饿汉式是线程安全的
   2. 懒汉式：
      1. 目前写法的坏处：线程不安全 --> 多线程可一修改为线程安全的
      2. 好处：需要加载时才加载

   ```java
   //1.懒汉式：类加载时创建对象
   class Bank{
       //1.私有化类的构造器
       private Bank(){}
   
       //2.内部创建类的对象
       private static Bank instance = new Bank();
   
       //3.提供公共方法，返回类的对象
       public static Bank getInstance() {
           return instance;
       }
   }
   
   //2.饿汉式：第一次调用对象时创建对象（未加锁，线程不安全）
   class Order{
       //1.私有化类的构造器
       private Order(){};
   
       //2.声明当前类对象的变量，不进行初始化
       private static Order order;
   
       //3.声明puclic static的返回当前类对象的方法
       public static Order getInstance(){
           if (order == null) {
               order = new Order();
           }
           return order;
       }
   }
   ```

3. 单例模式的优点

   1. 由于单例模式只生成一个实例，**减少了系统性能的开销**，当一个对象的产生需要较多的资源时，如读取配置文件、产生其他依赖对象时，则可以通过在应用启东时直接产生一个单例对象，然后永久驻留在内存的方式来解决。

4. 应用场景

   1. 网站的计数器
   2. 应用程序的日志应用
   3. 数据库连接池
   4. 读取配置文件的类

## 理解main()方法

1. main()方法作为程序的入口
2. main()方法是一个普通的静态方法
3. main()方法也可以作为我们与控制台交互的方式

## 代码块

1. 代码块的作用：用来初始化类、对象
2. 代码块如果修饰的话，只能使用static
3. 分类：静态代码块 VS 非静态代码块
4. 静态代码块
   1. 内部可以有输入语句
   2. 随着类的加载而执行，而且只执行一次
   3. 如果在同一个类中定义了多个静态代码块，那就按照定义的先后顺序去执行，一般不会写多个，因为没有必要
   4. 静态代码块的执行要优先于非静态代码块
   5. 静态代码块内只能调用静态的属性、静态的方法，不能调用非静态的结构
   6. 作用：初始化类的信息
5. 非静态代码块
   1. 内部可以有输入语句
   2. 随着对象的创建而执行
   3. 每创建一个对象，就执行一次非静态代码块
   4. 如果在同一个类中定义多个非静态代码块，那就按照定义的先后顺序去执行，一般不会写多个，因为没有必要
   5. 非静态代码块可以调用静态属性、静态方法，或非静态代码块、非静态、方法
   6. 作用：可以在创建对象时，对对象的属性等进行初始化
6. 属性可以赋值的位置
   1. 默认初始化
   2. 显示初始化
   3. 构造器中初始化
   4. 有了对象以后，可以通过“对象.属性”或“对象.方法”的方式，进行赋值
   5. 在代码块中赋值
7. 对属性赋值的顺序
   1. 默认初始化
   2. 显示初始化、在代码块中赋值（看顺序，谁在前面谁先执行）
   3. 构造器中初始化
   4. 有了对象以后，可以通过“对象.属性”或“对象.方法”的方式，进行赋值

8. 调用顺序
   1. 由父及子，静态先行


```java

class Zi1 extends Fu{
    Zi1() {
        super("Fu参数");
        System.out.println("Zi1无参构造器");
    }

    Zi1(String str) {
        this();
        System.out.println("Zi1有参构造器：" + str);
    }

    static {
        System.out.println("Zi1静态代码块");
    }

    {
        System.out.println("Zi1非静态代码块");
    }
}

class Zi2 extends Zi1{
    Zi2() {
        super("Zi1参数");
        System.out.println("Zi2无参构造器");
    }

    Zi2(String str) {
        this();
        System.out.println("Zi2有参构造器：" + str);
    }

    static {
        System.out.println("Zi2静态代码块");
    }

    {
        System.out.println("Zi2非静态代码块");
    }
}
```

```shell
Fu静态代码块
Zi1静态代码块
Zi2静态代码块
Fu非静态代码块
Fu无参构造器
Fu有参构造器：Fu参数
Zi1非静态代码块
Zi1无参构造器
Zi1有参构造器：Zi1参数
Zi2非静态代码块
Zi2无参构造器
Zi2有参构造器：Zi2
```

9. 代码块示例：

```java
//静态代码块
static {
  //若干代码，随便写点啥吧。。。。
}

//非静态代码块
{
  //若干代码，随便写点啥吧。。。。
}
```

## final关键字

1. final：最终的
2. final可以用来修饰的结构：类、方法、变量
3. final用来修饰一个类：被修饰类不可以被其他类继承
   1. 例如：String类、System类、`StringBuffer`类
4. final修饰方法：表名此方法不可以被重写
   1. 例如：Object类的`getClass();`
5. final修饰变量：此时的“变量”就是一个常量
   1. final修饰属性：可以考虑赋值的位置有：显示初始化、代码块中初始化、构造器中初始化
   2. final修饰局部变量：
      1. final修饰形参时：表明此形参是一个常量，当我们调用此方法时，给常量形参赋一个实参，一旦赋值以后，就只能在方法体内使用此形参，不能进行重新赋值
      2. final修饰普通局部变量时：赋值后不可修改
6. static final：用来修饰属性（全局常量）

## native关键字

被native修饰的方法没有方法体，代表调用C或者C++代码，不会用Java代码实现，所以被隐藏了。

## abstract关键字

1. abstract：抽象的
2. abstract可以用来修饰的结构：类、方法
3. abstract修饰类：抽象类
   1. 此类不能实例化
   2. 抽象类中一定有构造器，便于子类实例化时调用（涉及：子类对象实例化的全过程）
   3. 开发中都会提供抽象类的子类，让子类对象实例化，完成相关操作
4. abstract修饰方法：抽象方法
   1. 抽象方法只有方法的声明，没有方法体
   2. 包含抽象方法的类，一定是一个抽象类，反之，抽象类中是可以没有抽象方法的
   3. 若子类重写了父类中所有的抽象方法后，此子类方可实例化
   4. 若子类没有重写父类中所有的抽象方法，则此类也是一个抽象类，需要使用abstract修饰
5. abstract使用上的注意的点
   1. abstract不能用来修饰：属性、构造器等结构
   2. abstract不能用来修饰私有方法、静态方法、final的方法、final的类

## 接口

1. 接口使用interface来定义
2. Java中，接口和类是并列的两个结构
3. 如何定义接口：定义接口中的成员
   1. `JDK7`及之前：只能定义全局常量和抽象方法
      1. 全局常量：public static final 的
      2. 抽象方法：public abstract 的
   2. `JDK8`：除了定义全局常量和抽象方法之外，还可以定义静态方法、默认方法
      1. 接口中定义的静态方法，只能通过接口调用
      2. 通过实现类的对象，可以调用接口中的默认方法
      3. 如果实现类重写了接口中的方法，使用实现类调用此方法时，被调用的是重写后的方法
      4. 如果子类（或实现类）继承的父类和实现的接口中，声明了同名同参的方法，那么子类在没有重写此方法的情况下，默认调用的是父类中同名同参的方法
      5. 如果实现了多个接口，并且多个接口中定义了同名同参数的默认方法，那么在实现类没有重写此方法的情况下，报错（接口冲突），此情况必须在实现类中重写方法
4. 接口中不能定义构造器，意味着接口不可以实例化
5. Java开发中，接口通过让类去实现（implements）的方式来使用
   1. 如果实现类覆盖了接口中所有抽象方法，则此实现类就可以实例化
   2. 如果实现类没有覆盖接口中所有的抽象方法，则此实现类仍为一个抽象类
6. Java类可以实现多个接口 ---> 弥补了Java单继承性的局限性
   1. 格式：class AA extends BB implements `CC,DD,EE`
7. 接口与接口之间可以继承，而且可以多继承
8. 接口具体的使用可以体现多态性
9. 接口实际上可以看做是一种规范
10. 如何在子类（或实现类）的方法调用父类、接口中被重写的方法
    1. 接口.super.方法()

## 内部类

1. Java中允许将一个类A声明在另一个类B中，则类A就是内部类，类B称为外部类
2. 内部类的分类：成员内部类（静态、非静态） VS 局部内部类（方法块、代码块、构造器）
3. 成员内部类
   1. 作为外部类的成员
      1. 调用外部类的结构
      2. 可以被static修饰
      3. 可以被四种不同的权限修饰
   2. 作为一个类
      1. 类内可以定义属性、方法、构造器等
      2. 可以被final修饰，表示此类不能被继承。言外之意，不使用final，就可以被继承
      3. 可以被abstract修饰
4. 关注如下三个问题
   1. 如何实例化成员内部类的对象
   2. 如何在成员内部类中区分调用外部类的结构
   3. 开发中局部内部类怎样使用

## 异常

1. 概述：在Java语言中，将程序执行中发生的不正常情况称为“异常”（开发中语法错误和逻辑错误不是异常）
2. 分类
   1. `error`：Java虚拟机无法解决的严重问题。如：`JVM`系统内部错误，资源耗尽等情况。比如`StackOverflowError`
   2. exception：其他因编程错误或偶然的外部因素导致的一般问题，可以使用针对性的代码处理
      1. 编译时异常（checked）
         1. `IOException`
            1. `FileNotFoundException`
         2. `ClassNotFoundException`
      2. 运行时异常（unchecked）
         1. `NullPointerException`
         2. `ArrayIndexOutOfBoundsException`
         3. `ClassCastException`
         4. `NumberFormatException`
         5. `InputMismatchException`
         6. `ArithmeticException`
      3. 处理异常（方式一）
         1. 使用try将可能出现异常的代码包装起来，在执行的过程中一旦出现异常，就会生成一个对应异常类的对象，根据此对象的类型，去catch中进行匹配
         2. 一旦try中的异常对象匹配到某一个catch时，就进入到catch中进行异常的处理。一旦处理完成就跳出当前try、catch结构（没有finally的情况）。继续执行其后的代码
         3. catch中的异常如果没有子父类关系，则谁声明在上，谁声明在下无所谓；catch中的异常类型如果满足子父类关系，则要求子类声明在父类的前面，否则报错
         4. 常用异常处理方式：
            1. `String getMessage()`
            2. `printStackTrace()`
         5. 在try结构中声明的变量，在出了try结构以后，就不再被调用
         6. try-catch-finally结构是可以嵌套的
         7. finally使用
            1. finally是可选的
            2. finally中声明的是一定会被执行的代码，即使catch中出现了异常，try中有return语句，catch中有return语句等情况
            3. 像数据库连接、输入输出流、网络编程Socket等资源，`JVM`是不能自动的回收，我们需要自己手动的进行资源释放，此时的资源释放，就需要放到finally当中
         8. 使用try-catch-finally处理编译时异常，使得程序编译时不再报错，但是运行时仍可能报错。相当于我们使用try-catch-finally将一个编译时可能出现的异常，延迟到运行时出现
         9. 开发中，由于运行时异常比较常见，所以我们通常就不针对运行时异常编写try-catch-finally了，针对于编译时异常，我们一定要考虑异常的处理
      4. 处理异常（方式二）
         1. throws + 异常类型
            1. 写在方法的声明处，指此方法执行时，可能会抛出的异常类型
            2. 当方法体执行时，出现异常，仍会在异常代码处生成一个异常类的对象，此对象满足throws后异常类型时，就会被抛出，异常代码后续的代码就不再执行
      5. try-catch-finally是将异常处理掉了，throws的方式只是将异常抛给了方法的调用者，并没有真正的将异常处理掉
      6. 方法重写的规则
         1. 子类重写的方法抛出的异常类型不大于父类被重写的方法抛出的异常类型
         2. 之所以有这个限制是因为多态的存在，定义一个方法入参为父类，在方法中调用父类会抛出异常的方法，我们可以做捕获操作，但是因为多态的存在，我们可以传入父类的子类对象，如果子类对象的重写方法抛出的异常比父类的异常大，将无法捕获异常
      7. try-catch-finally和throws的选择
         1. 如果父类中被重写的方法没有throws方式处理异常，则子类重写的方法也不能使用throws，意味着如果子类重写的方法有异常，必须使用try-catch-finally的方式去处理
         2. 执行的方法a中，先调用了另外几个方法，这几个方法时递进关系执行的，我们建议这几个方法使用throws的方法进行处理，而方法a可以使用try-catch-finally方式处理
      8. 自定义异常
         1. 继承于现有的异常结构：`RuntimeException`、Exception
         2. 提供全局常量：`serialVerionUID`
         3. 提供重载的构造器
   





