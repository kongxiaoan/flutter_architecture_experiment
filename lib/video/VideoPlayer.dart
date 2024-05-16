import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_experiment/video/video_layer_host.dart';
import 'package:flutter_architecture_experiment/video/video_layer_host_listener.dart';
import 'package:flutter_architecture_experiment/video/video_view.dart';

import '../model/discover_page_entity.dart';

abstract class VideoPlayer extends StatefulWidget
    implements VideoLayerHostListener {
  late VideoLayerHost _mLayerHost;

  void bindLayerHost(VideoLayerHost videoLayerHost) {
    _mLayerHost = videoLayerHost;
  }

  VideoLayerHost layerHost() {
    return _mLayerHost;
  }

  DiscoverPageEntity dataSource() {
    VideoPlayerScreen videoPlayerScreen = _mLayerHost.videoPlayerScreen;
    return videoPlayerScreen.getDataSource();
  }

  @override
  void onLayerHostAttachedToVideoView(VideoPlayerScreen videoPlayerScreen) {}

  @override
  void onLayerHostDetachedFromVideoView(VideoPlayerScreen videoPlayerScreen) {}
}
