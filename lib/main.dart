import 'package:flutter/material.dart';
import 'package:watch_app/screens/SplashScreen.dart';
import 'package:watch_app/screens/music_screen.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ISLAM',
      theme: ThemeData.dark(useMaterial3: true),
      home:  SplashScreen(),
    );
  }
}
