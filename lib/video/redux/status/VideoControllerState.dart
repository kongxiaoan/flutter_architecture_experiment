import 'package:flutter_architecture_experiment/video/redux/models/VideoStateModel.dart';

class VideoControllerState {
  VideoStateModel videoStateModel;

  VideoControllerState({required this.videoStateModel});

  factory VideoControllerState.initial() =>
      VideoControllerState(videoStateModel: VideoStateModel.initial());
}
