import 'package:base/base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/controller/discover_page_controller.dart';
import 'package:flutter_architecture_experiment/model/discover_page_entity.dart';

import '../discover_list_item_video_page.dart';

class DiscoverPage extends MvcBaseView<DiscoverPageController> {
  @override
  MvcBaseState<MvcBaseModel, StatefulWidget> create() => _DiscoverPage();

  @override
  DiscoverPageController createController() => DiscoverPageController();
}

class _DiscoverPage extends MvcBaseState<DiscoverPageEntity, DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.controller.getNetworkData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<DiscoverPageEntity>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error： ${snapshot.error}'),
            );
          } else {
            if (snapshot.data == null || snapshot.data!.isEmpty) {
              return Center(
                child: Text('当前没有数据～'),
              );
            }
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListVideoItemPage(snapshot.data![index]);
                  }),
            );
          }
        });
  }

  @override
  void observer(DiscoverPageEntity event) {
    // TODO: implement observer
  }
}
