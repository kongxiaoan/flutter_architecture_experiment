import 'dart:async';

import 'package:base/mvc/mvc_base_model.dart';

abstract class MvcBaseController<M extends MvcBaseModel> {
  late M _model;
  final _dataUpdatedController = StreamController<M>.broadcast();

  MvcBaseController() {
    _model = createModel();
  }

  void updateData(M model) {
    _dataUpdatedController.add(model);
  }

  M createModel();

  StreamController<M> get streamController => _dataUpdatedController;

  M get model => _model;
}
