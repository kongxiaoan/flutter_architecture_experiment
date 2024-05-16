import 'package:flutter/material.dart';

import '../VideoPlayer.dart';

class VideoInfoLayer extends VideoPlayer {
  @override
  State<VideoInfoLayer> createState() => _VideoInfoState();
}

class _VideoInfoState extends State<VideoInfoLayer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 30,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.dataSource().title,
                    style: const TextStyle(fontSize: 21, color: Colors.white),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    widget.dataSource().des,
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  )
                ],
              )),
        )
      ],
    );
  }
}

/**
 * Positioned(
    bottom: 30,
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    widget.mLayerHost.videoPlayerScreen.entity.title,
    style: const TextStyle(fontSize: 21, color: Colors.white),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    ),
    const SizedBox(
    height: 8,
    ),
    Text(
    widget.mLayerHost.videoPlayerScreen.entity.des,
    style: const TextStyle(fontSize: 16, color: Colors.white),
    )
    ],
    )),
    );
 */
