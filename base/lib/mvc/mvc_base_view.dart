
import 'package:base/base.dart';
import 'package:flutter/cupertino.dart';

abstract class MvcBaseView<C extends MvcBaseController> extends StatefulWidget {
  late C controller;

  MvcBaseView({super.key}) {
    controller = createController();
  }

  @override
  State<StatefulWidget> createState() {
    print("create state ${controller.streamController == null}");
    MvcBaseState mvcBaseState = create();
    mvcBaseState.createStreamController(controller.streamController);
    return mvcBaseState;
  }

  MvcBaseState create();

  C createController();
}
