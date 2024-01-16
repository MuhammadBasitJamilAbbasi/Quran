import 'package:flutter/material.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import 'package:watch_app/constants.dart';

import 'components/music_controller.dart';
import 'components/volume_and_favorite.dart';

class MusicPlayerScreen extends StatefulWidget {
  const MusicPlayerScreen({super.key});

  @override
  State<MusicPlayerScreen> createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SquarePercentIndicator(
            height: 60,
            width: 60,
            progress: 0.6,
            borderRadius: 8,
            progressWidth: 3,
            shadowWidth: 3,
            shadowColor: grayColor,
            progressColor: Colors.white,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.asset(
                "assets/medina.jpeg",
              ),
            ),
          ),
          Text(
            "𝐓𝐨𝐩 10 𝐍𝐚𝐚𝐭 [𝐒𝐥𝐨𝐰𝐞𝐝+𝐑𝐞𝐯𝐞𝐫𝐛] - 1 Dev Muhammad Basit",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
          ),
          const MusicController(),
          const VolumeAndFavorite()
        ],
      ),
    );
  }
}
