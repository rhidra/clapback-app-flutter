import 'package:clapback_app/components/loading.dart';
import 'package:clapback_app/services/api-client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreenController {
  void Function() rewind;
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;
  final VideoPlayerScreenController controller;

  VideoPlayerScreen(this.videoUrl, [this.controller]) : super();

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState(controller);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  _VideoPlayerScreenState(VideoPlayerScreenController _controller) {
    if (_controller != null) {
      _controller.rewind = rewind;
    }
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        ApiClient.formatMedia(widget.videoUrl, 'video'));

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void rewind() {
    _controller
        .seekTo(Duration(seconds: _controller.value.position.inSeconds - 10));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}
