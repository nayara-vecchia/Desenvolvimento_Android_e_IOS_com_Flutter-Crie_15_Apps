import 'package:flutter/material.dart';
import 'package:app07_youtube_app/models/video.dart';
import 'package:app07_youtube_app/api/youtube_api.dart';
import 'package:app07_youtube_app/screens/video_screen.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.search});
  String search;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  _listVideos(String researchString) {
    Api api = Api();
    return api.pesquisar(researchString);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
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
                  List<Video> videos = snapshot.data!;
                  Video video = videos[index];

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
