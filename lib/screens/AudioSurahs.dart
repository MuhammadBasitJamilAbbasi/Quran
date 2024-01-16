import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:quran/quran.dart' as quran;
import 'package:watch_app/screens/Audiocontroller.dart';



class Audiosurah extends StatefulWidget {
  int surahnumber;

  Audiosurah({required this.surahnumber});

  @override
  State<Audiosurah> createState() => _AudiosurahState();
}

// ... (imports remain unchanged)

class _AudiosurahState extends State<Audiosurah> {
  final Audiocontroller audiocontroller = Get.put(Audiocontroller());
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    // Listen for player state, position, and duration changes
    audiocontroller.player.playerStateStream.listen((state) {
      setState(() {
        isPlaying = audiocontroller.player.playing;
        if (audiocontroller.player.duration != null) {
          duration = audiocontroller.player.duration!;
        }
      });
    });

    audiocontroller.player.positionStream.listen((currentPosition) {
      setState(() => position = currentPosition);
    });

    audiocontroller.player.durationStream.listen((totalDuration) {
      setState(() => duration = totalDuration!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: Text(quran.getSurahName(widget.surahnumber)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [



            // Display audio metadata
            Text('${position.toString().split('.')[0]}/${duration.toString().split('.')[0]}'),
            const SizedBox(height: 20),

            // Progress bar
            Slider(
              value: position.inSeconds.toDouble(),
              min: 0.0,
              max: duration.inSeconds.toDouble(),
              onChanged: (value) => audiocontroller.seek(Duration(seconds: value.toInt())),
            ),


            Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
              ElevatedButton(
                onPressed: _togglePlay,
                child: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                ),
              ),
              const SizedBox(height: 5),
              // Stop button
              ElevatedButton(
                onPressed: _stop,
                child: const Icon(Icons.stop),
                style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(),
                  padding: const EdgeInsets.all(10),
                ),
              ),
            ],)
            // Rounded play/pause button

          ],
        ),
      ),
    );
  }

  void _togglePlay() async {
    try {
      if (isPlaying) {
        await audiocontroller.pause();
      } else {
        if (audiocontroller.player.playing) {
          // Store the current position before pausing
          final currentPosition = await audiocontroller.player.position;
          await audiocontroller.pause();

          // Resume from the stored position
          await audiocontroller.play(quran.getAudioURLBySurah(widget.surahnumber));
          await audiocontroller.seek(currentPosition);
        } else {
          // If not playing, start from the beginning
          await audiocontroller.play(quran.getAudioURLBySurah(widget.surahnumber));
        }
      }
      setState(() => isPlaying = !isPlaying);
    } catch (e) {
      // Handle errors (display an error message or log for debugging)
      print('Error in toggle play: $e');
    }
  }

  void _stop() async {
    try {
      await audiocontroller.stop();
      setState(() => isPlaying = false);
    } catch (e) {
      // Handle errors (display an error message or log for debugging)
      print('Error in stop: $e');
    }
  }
}

