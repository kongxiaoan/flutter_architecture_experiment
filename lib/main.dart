import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/simple_mvc/controller/CounterController.dart';
import 'package:flutter_architecture_experiment/simple_mvc/view/CounterView.dart';

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
