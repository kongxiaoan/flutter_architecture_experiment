import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/model/discover_page_entity.dart';
import 'package:flutter_architecture_experiment/video/video_layer_host.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final DiscoverPageEntity entity;

  const VideoPlayerScreen({required this.entity});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();

  DiscoverPageEntity getDataSource() => entity;
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    print("widget = ${widget.entity.toString()}");
    _controller = VideoPlayerController.file(File(widget.entity.url));
    // Initialize the controller and store the Future for later use.
    try {
      _initializeVideoPlayerFuture = _controller.initialize().then((value) => {
            setState(() {
              _controller.play();
            })
          });
    } catch (e) {
      print('Failed to initialize video player: $e');
    }

    // 添加播放状态变化的监听器
    _controller.addListener(() {
      if (_controller.value.isPlaying) {
        // 当视频处于播放状态时执行的操作
        print('视频正在播放');
      } else if (!_controller.value.isPlaying) {
        // 当视频处于暂停状态时执行的操作
        print('视频已暂停');
      } else if (_controller.value.isBuffering) {
        // 当视频处于缓冲状态时执行的操作
        print('视频正在缓冲');
      } else if (_controller.value.isCompleted) {
        // 当视频播放完成时执行的操作
        print('视频播放完成');
      }
    });

    // _controller.initialize().then((_) {
    //   // Ensure the first frame is shown after the video is initialized,
    //   // even before the play button has been pressed.
    //   setState(() {});
    // });
    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          print("视频播放----> ${snapshot.connectionState}");
          if (snapshot.hasError) {
            print("error = ${snapshot.error}");
            return const Center(
              child: Text('播放错误'),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            // If the VideoPlayerController has finished initialization, use
            // the data it provides to limit the aspect ratio of the video.
            return Container(
              color: Colors.black,
              alignment: Alignment.center,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            // If the VideoPlayerController is still initializing, show a
            // loading spinner.
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
