import 'package:base/base.dart';
import 'package:flutter_architecture_experiment/model/main_page_entity.dart';

class MainPageController extends MvcBaseController<MainPageEntity> {
  @override
  MainPageEntity createModel() => MainPageEntity();
}
