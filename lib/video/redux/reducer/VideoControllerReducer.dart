// 定义 reducer
import 'package:flutter_architecture_experiment/video/redux/models/VideoStateModel.dart';

import '../actions/ToggleVisibilityAction.dart';
import '../status/VideoControllerState.dart';

VideoControllerState reducer(VideoControllerState state, dynamic action) {
  VideoStateModel model = state.videoStateModel;
  if (action is ToggleVisibilityAction) {
    model.isVisible = !model.isVisible;
  }
  return VideoControllerState(videoStateModel: model);
}
