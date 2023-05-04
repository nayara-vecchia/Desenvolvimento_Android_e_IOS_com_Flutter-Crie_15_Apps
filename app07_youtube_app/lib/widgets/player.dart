// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// /// Homepage
// class Player extends StatefulWidget {
//   const Player({super.key, required this.videoId});
//   final String videoId;
//   @override
//   _PlayerState createState() => _PlayerState();
// }

// class _PlayerState extends State<Player> {
//   @override
//   Widget build(BuildContext context) {
//     YoutubePlayerController _controller = YoutubePlayerController(
//       initialVideoId: widget.videoId,
//       flags: YoutubePlayerFlags(
//         autoPlay: true,
//         mute: true,
//       ),
//     );

//     return YoutubePlayerBuilder(
//         player: YoutubePlayer(
//           controller: _controller,
//           showVideoProgressIndicator: true,
//           progressIndicatorColor: Colors.amber,
//           progressColors: ProgressBarColors(
//             playedColor: Colors.amber,
//             handleColor: Colors.amberAccent,
//           ),
//           topActions: [
//             const SizedBox(width: 8.0),
//             Expanded(
//               child: Text(
//                 _controller.metadata.title,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 18.0,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//               ),
//             ),
//             IconButton(
//               icon: const Icon(
//                 Icons.settings,
//                 color: Colors.white,
//                 size: 25.0,
//               ),
//               onPressed: () {
//                 print('Settings Tapped!');
//               },
//             ),
//           ],
//           onReady: () {},
//           bottomActions: [
//             CurrentPosition(),
//             ProgressBar(isExpanded: true),
//             // TotalDuration(),
//           ],
//         ),
//         builder: (context, player) {
//           return Scaffold(
//               appBar: AppBar(
//             leading: Padding(
//               padding: const EdgeInsets.only(left: 12.0),
//               child: Image.asset(
//                 'assets/ypf.png',
//                 fit: BoxFit.fitWidth,
//               ),
//             ),
//             title: const Text(
//               'Youtube Player Flutter',
//               style: TextStyle(color: Colors.white),
//             ),
//           ));
//         });
//   }
// }
