// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// class YoutubeVideoPlayerFlutter extends StatefulWidget {
//   const YoutubeVideoPlayerFlutter({super.key});

//   @override
//   State<YoutubeVideoPlayerFlutter> createState() =>
//       _YoutubeVideoPlayerFlutterState();
// }

// class _YoutubeVideoPlayerFlutterState extends State<YoutubeVideoPlayerFlutter> {
//   final videoURL = "https://youtu.be/SkoUu1vhgbg?si=Aj56GaaOYqQ9rhld";
//   late YoutubePlayerController playerController;

//   @override
//   void initState() {
//     final videoId = YoutubePlayer.convertUrlToId(videoURL);
//     playerController = YoutubePlayerController(
//       initialVideoId: videoId!,
//       flags: const YoutubePlayerFlags(autoPlay: false),
//     );

//     super.initState();
//   }

//   void seekForward() {
//     final currentPosition = playerController.value.position;
//     final duration = playerController.value.metaData.duration;
//     if (currentPosition.inSeconds + 10 < duration.inSeconds) {
//       playerController.seekTo(currentPosition + const Duration(seconds: 10));
//     }
//   }

//   void seekBackward() {
//     final currentPosition = playerController.value.position;
//     if (currentPosition.inSeconds - 10 > 0) {
//       playerController.seekTo(currentPosition - const Duration(seconds: 10));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Youtube Player Video Tutorial"),
//       ),
//       body: ListView(
//         children: [
//           YoutubePlayer(controller: playerController),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideoPlayer extends StatefulWidget {
  @override
  _YouTubeVideoPlayerState createState() => _YouTubeVideoPlayerState();
}

class _YouTubeVideoPlayerState extends State<YouTubeVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the YouTube Player Controller
    _controller = YoutubePlayerController(
      initialVideoId: 'dQw4w9WgXcQ', // Replace with your YouTube video ID
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YouTube Video Player'),
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.blueAccent,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _controller.load('tgbNymZ7vqY'); // Load another video
            },
            child: const Text('Play Another Video'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
