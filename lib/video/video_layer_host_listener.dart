import 'package:flutter_architecture_experiment/video/video_view.dart';

abstract class VideoLayerHostListener {
  void onLayerHostAttachedToVideoView(VideoPlayerScreen videoPlayerScreen);

  void onLayerHostDetachedFromVideoView(VideoPlayerScreen videoPlayerScreen);
}
