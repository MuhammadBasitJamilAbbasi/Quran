
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:square_percent_indicater/square_percent_indicater.dart';
import 'package:watch_app/screens/AudioSurahnames.dart';

import '../constants.dart';
import 'music_screen.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    // TODO: implement initState
    Timer(
        Duration(seconds: 10),
            () =>

            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>AudioSurahnames()))
    );

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquarePercentIndicator(
              height: 60,
              width: 60,
              progress: 0.6,
              borderRadius: 8,
              reverse: true,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Full Audio Quran \n Developer:Muhammad Basit ",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Colors.white30,
                  fontSize: 8,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}