import 'package:base/base.dart';

class CounterModel extends MvcBaseModel {
  int _counter = 0;

  int get counter => _counter;

  increment() {
    _counter++;
  }

  @override
  void dispose() {}
}
