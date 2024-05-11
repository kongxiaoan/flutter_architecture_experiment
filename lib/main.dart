import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/controller/splash_page_controller.dart';
import 'package:flutter_architecture_experiment/view/splash_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SplashPage(),
    );
  }
}
