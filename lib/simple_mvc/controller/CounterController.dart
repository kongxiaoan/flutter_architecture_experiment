import 'package:base/base.dart';
import 'package:flutter_architecture_experiment/simple_mvc/model/CounterModel.dart';
import 'package:network/network.dart';
class CounterController extends MvcBaseController<CounterModel> {
  @override
  CounterModel createModel() => CounterModel();

  void incrementCounter() {
    var res = HttpRequest.get("orgs/flutterchina/repos", null);
    print(res);
    model.increment();
    updateData(model);
  }

  int get counter => model.counter;
}
