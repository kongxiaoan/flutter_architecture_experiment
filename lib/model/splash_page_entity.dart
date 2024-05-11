import 'package:base/base.dart';

class SplashPageEntity extends MvcBaseModel {
  int _initProgress = 0;

  setInitProfress(int progress) {
    _initProgress = progress;
  }

  int get initProgress => _initProgress;

  @override
  void dispose() {}
}
