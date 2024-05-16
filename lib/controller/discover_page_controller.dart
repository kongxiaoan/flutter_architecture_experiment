import 'dart:io';

import 'package:base/base.dart';
import 'package:flutter_architecture_experiment/model/discover_page_entity.dart';
import 'package:photo_manager/photo_manager.dart';

class DiscoverPageController extends MvcBaseController<DiscoverPageEntity> {
  @override
  DiscoverPageEntity createModel() => DiscoverPageEntity.empty();

  Future<List<DiscoverPageEntity>> getNetworkData() async {
    final List<AssetEntity> recentMedia = await PhotoManager.getAssetPathList(
      onlyAll: true,
      type: RequestType.video,
      filterOption: FilterOptionGroup(),
    ).then((List<AssetPathEntity> assetPathList) async {
      return assetPathList[0]
          .getAssetListPaged(page: 0, size: 100)
          .then((List<AssetEntity> assetList) => assetList);
    });
    List<DiscoverPageEntity> list = [];
    for (var ele in recentMedia) {
      File? file = await ele.file;
      if (file != null) {
        DiscoverPageEntity entity = DiscoverPageEntity(
            title: ele.title ?? "我是标题",
            des: ele.title ?? "我是描述",
            url: file.path!);
        list.add(entity);
      }
    }
    print("list size = ${list.length}");
    return list;
  }
}
