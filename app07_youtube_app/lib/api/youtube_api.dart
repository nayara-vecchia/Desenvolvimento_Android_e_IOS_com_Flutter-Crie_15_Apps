import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:app07_youtube_app/models/video.dart';


const API_KEY = "AIzaSyDeWtJoVFU9jI-3dfo56F5O1h9Eg_yklQ0";
const CHANNEL_ID = "UCSIvrn68cUk8CS8MbtBmBkA";
const BASE_URL = "www.googleapis.com";
const PATH_URL = '/youtube/v3/search';


class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
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
        'q': pesquisa,
      },
    );

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);

      List<Video> videos = jsonData['items'].map<Video>(
        (video) {
          return Video.fromJson(video);
        }
      ).toList();
      return videos;
    } 

    throw(response.statusCode);
  }
}
