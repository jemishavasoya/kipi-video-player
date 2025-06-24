import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'analytics_controller.dart';

class YoutubeVideoPlayer extends StatefulWidget {
  final String youtubeUrl;
  const YoutubeVideoPlayer({Key? key, required this.youtubeUrl}) : super(key: key);

  @override
  State<YoutubeVideoPlayer> createState() => _YoutubeVideoPlayerState();
}

class _YoutubeVideoPlayerState extends State<YoutubeVideoPlayer> {
  late final PodPlayerController _controller;
  late final AnalyticsController _analytics;
  double _lastPosition = 0.0;

  @override
  void initState() {
    super.initState();
    _analytics = AnalyticsController();
    _controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.youtube(widget.youtubeUrl),
    )..initialise();
    _controller.addListener(_onControllerUpdate);
  }

  void _onControllerUpdate() {
    final value = _controller.videoPlayerValue;
    if (value == null) return;
    if (value.isPlaying && !_controller.wasPlaying) {
      _analytics.onPlay();
    }
    if (!value.isPlaying && _controller.wasPlaying) {
      _analytics.onPause();
    }
    if (value.position.inSeconds != _lastPosition.toInt()) {
      _analytics.onPositionUpdate(value.position.inSeconds.toDouble());
      _lastPosition = value.position.inSeconds.toDouble();
    }
    if (value.playbackSpeed != _analytics._lastSpeed) {
      _analytics.onSpeedChange(value.playbackSpeed);
    }
    // Detect seek
    if ((value.position - Duration(seconds: _lastPosition.toInt())).inSeconds.abs() > 2) {
      _analytics.onSeek(_lastPosition, value.position.inSeconds.toDouble());
      _lastPosition = value.position.inSeconds.toDouble();
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onControllerUpdate);
    _controller.dispose();
    _analytics.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PodVideoPlayer(controller: _controller);
  }
} 