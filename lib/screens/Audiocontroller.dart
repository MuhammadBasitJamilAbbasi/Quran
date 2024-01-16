
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';


class Audiocontroller extends GetxController {
  final AudioPlayer player = AudioPlayer();

  Future<void> play(String url) async {
    await player.setUrl(url);
    await player.play();
  }

  Future<void> pause() async {
    await player.pause();
  }

  Future<void> stop() async {
    await player.stop();
  }

  // Existing function for initial setup
  Future auidosurahplay(String url) async {
    try {
      await player.setUrl(url);
      await player.play();
    } catch (e) {
      print('Error playing audio: $e');
    }
    return false;
  }
  Future<void> seek(Duration position) async {
    await player.seek(position);
  }
}
