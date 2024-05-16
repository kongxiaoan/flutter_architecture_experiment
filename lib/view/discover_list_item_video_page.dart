import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/model/discover_page_entity.dart';
import 'package:flutter_architecture_experiment/video/video_layer_host.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../video/redux/reducer/VideoControllerReducer.dart';
import '../video/redux/status/VideoControllerState.dart';
import '../video/video_view.dart';

class ListVideoItemPage extends StatelessWidget {
  final DiscoverPageEntity entity;

  ListVideoItemPage(this.entity, {super.key});

  final store = Store<VideoControllerState>(reducer,
      initialState: VideoControllerState.initial());

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
        store: store,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: _buildItemPage(),
              ),
            ],
          ),
        ));
  }

  Widget _buildItemPage() {
    VideoPlayerScreen screen = VideoPlayerScreen(entity: entity);
    return Stack(
      children: [screen, VideoLayerHost(screen)],
    );
  }
}
