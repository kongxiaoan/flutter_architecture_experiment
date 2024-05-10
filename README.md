一个平台语言的开发优秀与否，取决于两个维度，一是语言的设计，这是语言天然的优劣，另一个测试程序员。

后者决定的东西太多太多了，如果后者对于某个平台类型的语言开发使用不当，那将导致非常严重的后果，屎山的形成、开发排期的无限增大、稳定性差到太平洋等等问题。

我之前写过一个Fluter的项目，但是写时Flutter还没有发布正式版本，到今天Flutter已经成为一棵参天大树，无数的同僚前辈已经用Flutter密谋生计。这两天看了一下相关的语法、技术， 决定对其进行二次熟悉。

从哪方面入手，成了我的第一个问题，看文档？记不住，看视频？ 没时间，做项目？没需求（相关的）。所以决定探究一下开篇的问题，如何在新语言领域做好开发。

进来我一直在关注架构方面的技术，到没想着成为架构师（因为我太菜），只是想成为一个懂点架构的程序员，让自己的代码有良好的扩展性、维护性、可读性、健壮性，以此来洗涤自我心灵，让自己每天过的舒服点，**因为好的代码看起来确实会让人心情愉悦，让领导喜笑颜开，让钱包增厚那么一奶奶。**

### 一、 常见的Flutter 架构模式

其实还是老生常谈的几个问题，**最终的目的就是： “高内聚，低耦合”，满足这个条件 让程序运行就可以了**。

Fluter中常见的架构模式有以下几种：
1. **MVC（Model-View-Controller）：** 这是一种传统的软件设计架构，将应用程序分为模型（Model）、视图（View）和控制器（Controller）三个部分。在 Flutter 中，你可以使用类似于 `StatefulWidget`、`State` 和其他 Dart 类来实现 MVC 架构。
2. **MVVM（Model-View-ViewModel）：** MVVM 是一种流行的设计模式，将视图（View）、模型（Model）和视图模型（ViewModel）分离。在 Flutter 中，你可以使用类似于 `Provider`、`GetX`、`Riverpod` 等状态管理库来实现 MVVM 架构。
3. **Bloc（Business Logic Component）：** Bloc 是一种基于事件驱动的架构，用于管理应用程序的业务逻辑和状态。它将应用程序分为视图、状态和事件三个部分，并使用流（Stream）来处理数据流。Flutter 官方推荐使用 `flutter_bloc` 库来实现 Bloc 架构。
4. **Redux：** Redux 是一种状态管理模式，最初是为 Web 应用程序设计的，但也可以在 Flutter 中使用。它通过单一不可变的状态树来管理应用程序的状态，并使用纯函数来处理状态变化。在 Flutter 中，你可以使用 `flutter_redux` 或 `provider` 与 `redux` 库结合使用来实现 Redux 架构。
5. **GetX：** GetX 是一个轻量级的、高性能的状态管理和路由导航库，它提供了一个全面的解决方案，包括状态管理、依赖注入、路由导航等。GetX 非常适合中小型 Flutter 应用程序的开发，可以减少代码量并提高开发效率。

当然MVP也不是不行。

对于Flutter来讲不仅有熟悉的MXXX, 还有几种新的模式。今天就先从最简单的MVC模式开始探究。
### 二、MVC架构实现Flutter开发

什么是MVC这里简单复习一下：

MVC（Model-View-Controller）是一种软件设计架构，用于将应用程序分为三个主要组件：模型（Model）、视图（View）和控制器（Controller）。这种架构的目的是将应用程序的逻辑部分与用户界面部分分离，以便于管理和维护。

以下是 MVC 架构中各组件的功能和作用：

1. **模型（Model）：** 模型是应用程序的数据和业务逻辑部分。它负责管理数据的状态和行为，并提供对数据的操作接口。模型通常包括数据存储、数据验证、数据处理等功能。模型与视图和控制器相互独立，不直接与用户界面交互。
2. **视图（View）：** 视图是应用程序的用户界面部分，负责向用户展示数据和接收用户输入。视图通常包括界面布局、样式设计、用户交互等功能。视图与模型和控制器相互独立，不直接与数据交互。
3. **控制器（Controller）：** 控制器是模型和视图之间的中介，负责处理用户输入和更新模型数据。它接收用户的操作请求，并根据需要调用模型的方法来执行相应的业务逻辑，然后更新视图以反映数据的变化。控制器与模型和视图都有联系，但它们之间不直接通信。

在Flutter中 M无关紧要，只需要参与整个逻辑，让代码统一就可以了，封装一个对应的base，管理释放资源啊 公共数据也是可以的。

#### 2.1 设计base

首先使用命令在Flutter项目中创建一个base, 创建时按照Flutter的工程类型做好组件的职责选择：
Flutter工程中，通常有以下几种工程类型，下面分别简单概述下：  
**1. Flutter Application**  
标准的Flutter App工程，包含标准的Dart层与Native平台层  
**2. Flutter Module**  
Flutter组件工程，仅包含Dart层实现，Native平台层子工程为通过Flutter自动生成的隐藏工程  
**3. Flutter Plugin**  
Flutter平台插件工程，包含Dart层与Native平台层的实现  
**4. Flutter Package**  
Flutter纯Dart插件工程，仅包含Dart层的实现，往往定义一些公共Widget

很明显 我们需要的base 创建为package 即可：
```
 flutter create -t package base 
```

然后在项目的pubspec.yaml 中的

```
dependencies:
  flutter:
    sdk: flutter
  base: //此处添加配置
    path: ../base
```

- base 结构

![image.png](https://p1-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/8ee7b2ef3fff41e784fe48f1457f1e27~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=1532&h=1588&s=221491&e=png&b=fdfafa)

View部分按照Flutter的常用开发模式（可变状态组件）设计为state + view 组合成View

他们的关系如下图：

![image.png](https://p6-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/e665bb66f03d447ea3f12b867b56310e~tplv-k3u1fbpfcp-jj-mark:0:0:0:0:q75.image#?w=2018&h=1208&s=105726&e=png&b=ffffff)


代码：

##### 2.1.1 base 代码

1. model;

```
abstract class MvcBaseModel {
  void dispose();
}
```

2. controller

```
abstract class MvcBaseController<M extends MvcBaseModel> {
  late M _model;
  final _dataUpdatedController = StreamController<M>.broadcast();

  MvcBaseController() {
    _model = createModel();
  }

  void updateData(M model) {
    _dataUpdatedController.add(model);
  }

  M createModel();

  StreamController<M> get streamController => _dataUpdatedController;

  M get model => _model;
}
```

3. view. (view)
```
abstract class MvcBaseView<C extends MvcBaseController> extends StatefulWidget {
  final C controller;

  const MvcBaseView({Key? key, required this.controller});

  @override
  State<StatefulWidget> createState() {
    print("create state ${controller.streamController == null}");
    MvcBaseState mvcBaseState = create();
    mvcBaseState.createStreamController(controller.streamController);
    return mvcBaseState;
  }

  MvcBaseState create();
}
```

4. view(state)

```
abstract class MvcBaseState<M extends MvcBaseModel, T extends StatefulWidget>
    extends State<T> {
  late StreamController<M> streamController;
  late StreamSubscription<M> _streamSubscription;


  @override
  Widget build(BuildContext context);

  @override
  void initState() {
    super.initState();
    print("init state");
    _streamSubscription = this.streamController.stream.listen((event) {
      setState(() {
        observer(event);
      });
    });
  }

  void createStreamController(StreamController<M> streamController) => this.streamController = streamController;

  void observer(M event);

  @override
  void dispose() {
    _streamSubscription.cancel();
    streamController.close();
    super.dispose();
  }
}
```

### 三、使用Demo

1. 入口：

```

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterView(controller: CounterController()),
    );
  }
}
```

2. view + state

```

class CounterView extends MvcBaseView<CounterController> {
  const CounterView({super.key,required CounterController controller})
      : super(controller: controller);

  @override
  MvcBaseState<MvcBaseModel, StatefulWidget> create() => _CounterViewState();
}

class _CounterViewState extends MvcBaseState<CounterModel, CounterView> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter App (MVC)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Counter Value = :',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '${count}',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  debugPrint("---11-->");
                  // setState(() {
                  widget.controller.incrementCounter();
                  // });
                },
                child: Text('Test Add111'))
          ],
        ),
      ),
    );
  }

  @override
  void observer(CounterModel event) {
    count = event.counter;
  }
}
```

3. model

```
class CounterModel extends MvcBaseModel{
  int _counter = 0;

  int get counter => _counter;

  increment() {
    _counter++;
  }

  @override
  void dispose() {
  }
}
```

4. controller

```

class CounterController extends MvcBaseController<CounterModel> {
  @override
  CounterModel createModel() => CounterModel();

  void incrementCounter() {
    model.increment();
    updateData(model);
  }

  int get counter => model.counter;
}
```

### 四： 总结
通过实现基于MVC架构的Flutter应用程序，我们可以看到以下几点：

1.  **模型（Model）的作用：** 模型负责管理应用程序的数据状态和行为。在我们的示例中，CounterModel负责管理计数器的数值状态，并提供了增加计数器数值的方法。
1.  **控制器（Controller）的作用：** 控制器是模型和视图之间的中介，负责处理用户输入并更新模型数据。在示例中，CounterController接收用户点击事件，并调用CounterModel的方法来增加计数器数值，然后通知视图更新数据。
1.  **视图（View）的作用：** 视图是应用程序的用户界面部分，负责向用户展示数据和接收用户输入。在示例中，CounterView负责展示计数器的数值，并提供了一个按钮来触发增加计数器数值的操作。
1.  **MVC架构的优势：** MVC架构能够将应用程序的逻辑部分与用户界面部分分离，使得代码结构更清晰，易于维护和扩展。通过单独管理模型、视图和控制器，我们可以更好地组织代码，并实现高内聚、低耦合的设计原则。
1.  **基础组件的设计：** 我们设计了一个基础组件库，包括模型（MvcBaseModel）、控制器（MvcBaseController）、视图（MvcBaseView）和视图状态（MvcBaseState）。这些基础组件可以帮助我们快速构建符合MVC架构的Flutter应用程序，并实现模块化、可复用的代码结构。

通过理解和应用MVC架构，我们可以更好地组织和管理Flutter应用程序的代码，提高代码质量和开发效率。同时，我们也可以通过学习和探索其他架构模式，如MVVM、Bloc、Redux等，来丰富我们的架构设计思路，进一步提升应用程序的性能和用户体验。

后续将探索MVVM等其他架构模式。
