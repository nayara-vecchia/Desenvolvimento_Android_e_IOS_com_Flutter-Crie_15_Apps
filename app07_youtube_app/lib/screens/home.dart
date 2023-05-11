import 'package:flutter/material.dart';
import 'package:app07_youtube_app/models/video_model.dart';
import 'package:app07_youtube_app/api/youtube_api.dart';
import 'package:app07_youtube_app/widgets/video.dart';


class Home extends StatefulWidget {
  final String search;
  const Home({super.key, required this.search});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _listVideos(String researchString) {
    Api api = Api();
    return api.research(researchString);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<VideoModel>>(
      future: _listVideos(widget.search),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
            return const Center();
          case ConnectionState.done:
            if (snapshot.hasData) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  List<VideoModel> videos = snapshot.data!;
                  VideoModel video = videos[index];
                  return Video(video: video);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 3,
                    color: Colors.red,
                  );
                },
                itemCount: snapshot.data!.length,
              );
            }
            return Center(
              child: Text('http status code ${snapshot.error.toString()}'),
            );
          case ConnectionState.none:
            return const Center();
        }
      },
    );
  }
}
