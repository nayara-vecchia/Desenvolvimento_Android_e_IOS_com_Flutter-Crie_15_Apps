class VideoModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String channel;

  const VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.channel,
  });

//memory optimization due to using a single video instance
  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        description: json['snippet']['description'],
        imageUrl: json['snippet']['thumbnails']['high']['url'],
        channel: json['snippet']['channelTitle']);
  }
}
