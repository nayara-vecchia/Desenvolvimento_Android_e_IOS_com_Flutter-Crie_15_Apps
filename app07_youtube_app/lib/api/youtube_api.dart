import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

import 'package:app07_youtube_app/models/video_model.dart';

final API_KEY = dotenv.env['API_KEY'].toString();
final CHANNEL_ID = dotenv.env['CHANNEL_ID'].toString();
final BASE_URL = dotenv.env['BASE_URL'].toString();
final PATH_URL = dotenv.env['PATH_URL'].toString();

class Api {
  Future<List<VideoModel>> research(String researchQueryString) async {
    final url = Uri.https(
      BASE_URL,
      PATH_URL,
      {
        'part': 'snippet',
        'type': 'video',
        'maxResults': '10',
        'order': 'date',
        'key': API_KEY,
        'channelId': CHANNEL_ID,
        'q': researchQueryString,
      },
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      List<VideoModel> videos = jsonData['items'].map<VideoModel>(
        (video) {
          return VideoModel.fromJson(video);
        }
      ).toList();
      return videos;
    } 

    throw(response.statusCode);
  }
}
