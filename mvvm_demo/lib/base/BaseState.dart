import 'package:flutter/cupertino.dart';
import 'package:mvvm_demo/base/BaseViewModel.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget, VM extends BaseViewModel>
    extends State<T> {
  late VM viewModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0))
        .then((value) => viewModel = Provider.of<VM>(context));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
