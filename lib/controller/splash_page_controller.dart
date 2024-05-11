import 'package:base/base.dart';
import 'package:flutter_architecture_experiment/model/splash_page_entity.dart';

class SplashPageController extends MvcBaseController<SplashPageEntity> {
  @override
  SplashPageEntity createModel() => SplashPageEntity();

  Future<void> startInit() async {
    await delayAndSetProgress(0, 10);
    await delayAndSetProgress(0, 50);
    await delayAndSetProgress(0, 70);
    await delayAndSetProgress(0, 100);
  }

  Future<void> delayAndSetProgress(int seconds, int progress) async {
    await Future.delayed(Duration(seconds: seconds));
    model.setInitProfress(progress);
    updateData(model);
  }
}
