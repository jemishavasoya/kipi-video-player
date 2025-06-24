<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features
- YouTube video playback using [pod_player](https://pub.dev/packages/pod_player)
- Analytics logging: logs 'vplay' on play, logs every 30s with current speed and position, logs on seek/drag/skip (currently via print, can be replaced with API calls)

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

Add to your pubspec.yaml:

```yaml
dependencies:
  pod_custom_video_player:
    path: ../pod_custom_video_player # or your package location
```

Import and use in your widget:

```dart
import 'package:pod_custom_video_player/pod_custom_video_player.dart';

class MyVideoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return YoutubeVideoPlayer(
      youtubeUrl: 'https://youtu.be/A3ltMaM6noM',
    );
  }
}
```

## Analytics
- Logs 'vplay' when playback starts
- Every 30 seconds, logs current playback speed and position
- Logs when user seeks/drags/skips in the video
- All logs are currently print statements (replace with API calls as needed)

## Additional information

TODO: Tell users more about the package: where to find more information, how to
contribute to the package, how to file issues, what response they can expect
from the package authors, and more.
