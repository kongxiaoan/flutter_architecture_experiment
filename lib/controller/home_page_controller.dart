
import 'package:base/base.dart';
import 'package:flutter_architecture_experiment/model/home_page_entity.dart';

class HomePageController extends MvcBaseController<HomePageEntity>{
  @override
  createModel() => HomePageEntity();

}