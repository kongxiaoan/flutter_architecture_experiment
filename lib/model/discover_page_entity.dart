import 'package:base/base.dart';

class DiscoverPageEntity extends MvcBaseModel {
  String url;
  String title;
  String des;

  DiscoverPageEntity(
      {required this.title, required this.des, required this.url});

  DiscoverPageEntity.empty()
      : url = '',
        title = '',
        des = '';


  @override
  String toString() {
    return 'DiscoverPageEntity{url: $url, title: $title, des: $des}';
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
