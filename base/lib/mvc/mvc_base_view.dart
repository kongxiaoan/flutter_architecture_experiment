import 'dart:async';

import 'package:base/base.dart';
import 'package:base/mvc/mvc_base_controller.dart';
import 'package:flutter/cupertino.dart';

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
