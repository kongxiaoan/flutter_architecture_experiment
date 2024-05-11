import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_experiment/model/discover_page_entity.dart';

import '../video/video_view.dart';

class ListVideoItemPage extends StatelessWidget {
  final DiscoverPageEntity entity;

  const ListVideoItemPage(this.entity);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: VideoPlayerScreen(),
          ),
          Positioned(
            bottom: 30,
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${entity.title}',
                      style: TextStyle(fontSize: 21, color: Colors.white),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${entity.des}',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
