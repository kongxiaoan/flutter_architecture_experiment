import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/video/VideoPlayer.dart';
import 'package:flutter_architecture_experiment/video/layer/GestureDetectorLayer.dart';
import 'package:flutter_architecture_experiment/video/video_view.dart';
import 'package:flutter_redux/flutter_redux.dart';

import 'layer/video_info.dart';
import 'redux/status/VideoControllerState.dart';

class VideoLayerHost extends StatefulWidget {
  late VideoPlayerScreen videoPlayerScreen;
  final List<VideoPlayer> mLayers = [];

  VideoLayerHost(VideoPlayerScreen screen, {super.key}) {
    _attachToVideoView(screen);
  }

  void _attachToVideoView(VideoPlayerScreen videoPlayerScreen) {
    print("attachToVideoView");
    this.videoPlayerScreen = videoPlayerScreen;
  }

  List<VideoPlayer> buildPlayer() {
    // mLayers.add(layer);
    // layer.bindLayerHost(this);
    mLayers.clear();
    mLayers.add(VideoInfoLayer());
    _bindVideoPlayer();
    return mLayers;
  }

  @override
  State<StatefulWidget> createState() => _VideoLayerHostState();

  void _bindVideoPlayer() {
    if (mLayers.isEmpty) {
      return;
    }
    for (var element in mLayers) {
      element.bindLayerHost(this);
    }
  }
}

class _VideoLayerHostState extends State<VideoLayerHost> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<VideoControllerState, bool>(
      converter: (store) => store.state.videoStateModel.isVisible,
      builder: (context, isVisible) {
        return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                GestureDetectorLayer(),
                Visibility(
                    visible: isVisible,
                    child: Stack(
                      children: widget.buildPlayer(),
                    ))
              ],
            ));
      },
    );
  }

}
