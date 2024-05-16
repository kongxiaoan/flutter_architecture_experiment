library dart_lean;

import 'dart:async';

import 'package:dart_lean/EventBus.dart';

void testIsolate() async {
  print("Main function start");

  Timer(const Duration(seconds: 2), () {
    print("Event handler");
  });
  // 添加微任务
  Future.microtask(() {
    print("Microtask");
  });

  // 添加微任务
  Future.microtask(() {
    print("Microtask 1");
  });

  // 添加异步任务
  Future.delayed(const Duration(seconds: 1), () {
    print("Async task");
  });

  print("Main function end");
}

request() async {
  await Future.delayed(const Duration(seconds: 2));
  return "ok!";
}

doSomeThing() async {
  String data = await request();
  data = "ok from request";
  return data;
}

void main() {
  // testIsolate();
  doSomeThing().then((value) {
    print(value);
  });

  EventBus eventBus = EventBus();
  eventBus.on<Test>().listen((event) {
    print(event.name);
  });

  eventBus.fire(Test(name: "Tome"));
}

class Test {
  final String _name;

  String get name => _name;

  Test({required String name}) : _name = name;


}
