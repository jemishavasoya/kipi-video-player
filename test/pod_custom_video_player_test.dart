import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:pod_custom_video_player/pod_custom_video_player.dart';

void main() {
  testWidgets('YoutubeVideoPlayer builds', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: YoutubeVideoPlayer(youtubeUrl: 'https://youtu.be/A3ltMaM6noM'),
      ),
    );
    expect(find.byType(YoutubeVideoPlayer), findsOneWidget);
  });
}
