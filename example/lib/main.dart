import 'package:flutter/material.dart';
import 'package:pod_custom_video_player/pod_custom_video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Video Player Example')),
        body: const YoutubeVideoPlayer(
          youtubeUrl: 'https://youtu.be/A3ltMaM6noM',
        ),
      ),
    );
  }
}
