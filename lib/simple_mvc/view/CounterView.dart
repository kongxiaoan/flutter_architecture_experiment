import 'dart:async';

import 'package:base/base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/simple_mvc/controller/CounterController.dart';
import 'package:flutter_architecture_experiment/simple_mvc/model/CounterModel.dart';

class CounterView extends MvcBaseView<CounterController> {
  const CounterView({super.key, required CounterController controller})
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
