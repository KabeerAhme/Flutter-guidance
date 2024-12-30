import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  late YoutubePlayerController youtubePlayerController;

  @override
  void onInit() {
    super.onInit();
    String videoId = Get.parameters['videoId'] ?? '';
    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }
}
