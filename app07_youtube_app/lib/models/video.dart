class Video {
  String id;
  String title;
  String description;
  String imageUrl;
  String channel;

  Video({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.channel,
  });

//otimização de memória devido ao uso de uma única instância de Video
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        id: json['id']['videoId'],
        title: json['snippet']['title'],
        description: json['snippet']['description'],
        imageUrl: json['snippet']['thumbnails']['high']['url'],
        channel: json['snippet']['channelTitle']);
  }
}
