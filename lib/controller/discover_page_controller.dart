import 'package:base/base.dart';
import 'package:flutter_architecture_experiment/model/discover_page_entity.dart';

class DiscoverPageController extends MvcBaseController<DiscoverPageEntity> {
  @override
  DiscoverPageEntity createModel() => DiscoverPageEntity();

  Future<List<DiscoverPageEntity>> getNetworkData() async {
    await Future.delayed(Duration(seconds: 3));
    // 构建一个包含多个 DiscoverPageEntity 的列表
    List<DiscoverPageEntity> dataList = [
      DiscoverPageEntity(),
      DiscoverPageEntity(),
      DiscoverPageEntity()
    ];

    return dataList;
  }
}
