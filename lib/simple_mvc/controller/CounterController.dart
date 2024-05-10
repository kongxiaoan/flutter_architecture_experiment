import 'package:base/base.dart';
import 'package:flutter_architecture_experiment/simple_mvc/model/CounterModel.dart';

class CounterController extends MvcBaseController<CounterModel> {
  @override
  CounterModel createModel() => CounterModel();

  void incrementCounter() {
    model.increment();
    updateData(model);
  }

  int get counter => model.counter;
}
