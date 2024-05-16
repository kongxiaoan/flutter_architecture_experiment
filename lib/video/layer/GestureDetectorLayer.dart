import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/video/VideoPlayer.dart';
import 'package:flutter_architecture_experiment/video/redux/actions/ToggleVisibilityAction.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../redux/status/VideoControllerState.dart';

class GestureDetectorLayer extends VideoPlayer {

  @override
  State<StatefulWidget> createState() => _GestureDetectorLayerState();
}

class _GestureDetectorLayerState extends State<GestureDetectorLayer> {
  bool isSingle = false;
  @override
  Widget build(BuildContext context) {
    return StoreConnector<VideoControllerState, VoidCallback>(
        builder: (context, callback) {
          return Center(
            child: GestureDetector(
              child: Container(
                alignment: Alignment.center,
                color: Colors.transparent,
              ),
              onTap: () {
                isSingle = true;
                callback();
              },
              onDoubleTap: () {
                isSingle = false;
                callback();
              },
            ),
          );
        },
        converter: (store) {
          return () => store.dispatch(ToggleVisibilityAction(isVisible: isSingle));
        }
    );
  }
}
