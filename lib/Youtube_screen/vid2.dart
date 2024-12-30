import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';

class VideoPlayerScreen extends StatefulWidget {
  String name = "";
  VideoPlayerScreen({required this.name});
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _youtubePlayerController;
  String name = "";

  @override
  void initState() {
    super.initState();

    String videoLink = Get.arguments ?? '';
    name = videoLink;
    String videoId = YoutubePlayer.convertUrlToId(videoLink) ?? '';

    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        enableCaption: true,
        isLive: false,
        forceHD: false,
      ),
    );
  }

  void forward10Seconds() {
    final currentPosition = _youtubePlayerController.value.position;
    final newPosition = currentPosition + const Duration(seconds: 10);
    _youtubePlayerController.seekTo(newPosition);
  }

  void rewind10Seconds() {
    final currentPosition = _youtubePlayerController.value.position;
    final newPosition = currentPosition - const Duration(seconds: 10);
    if (newPosition < Duration.zero) {
      _youtubePlayerController.seekTo(Duration.zero);
    } else {
      _youtubePlayerController.seekTo(newPosition);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;

        return Scaffold(
          appBar: isLandscape
              ? null
              : AppBar(
                  centerTitle: true,
                  title: Text(
                    widget.name,
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0.0,
                  leading: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColors.primaryLight,
                      size: 30,
                    ),
                  ),
                ),
          body: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.blue.withOpacity(0.4),
              Colors.purple,
              Colors.purpleAccent.withOpacity(0.3),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _youtubePlayerController,
                      showVideoProgressIndicator: true,
                    ),
                    builder: (context, player) {
                      return player;
                    },
                  ),
                ),
                if (!isLandscape)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                          ),
                          onPressed: rewind10Seconds,
                          child: Icon(
                            Icons.replay_10,
                            size: 40,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          onPressed: forward10Seconds,
                          child: Icon(
                            Icons.forward_10,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }
}
