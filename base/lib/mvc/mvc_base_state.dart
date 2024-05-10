import 'dart:async';

import 'package:base/base.dart';
import 'package:flutter/material.dart';

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
