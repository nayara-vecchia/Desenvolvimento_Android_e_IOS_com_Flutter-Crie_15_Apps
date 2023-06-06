import 'package:flutter/material.dart';
import 'package:app07_youtube_app/models/video_model.dart';
import 'package:app07_youtube_app/screens/video_screen.dart';

class Video extends StatelessWidget {
  const Video({super.key, required this.video});
  final VideoModel video;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) {
              return VideoScreen(
                id: video.id,
              );
            }),
          ),
        );
      },
      child: Column(children: [
        Container(
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(video.imageUrl),
            ),
          ),
        ),
        ListTile(
          title: Text(video.title),
          subtitle: Text(video.channel),
        )
      ]),
    );
  }
}
