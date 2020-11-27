import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen(this.videoUrl) : super();

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'http://192.168.43.29:9000/media/video/${widget.videoUrl}/hls.m3u8');

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

/*
class VideoPlayerScreen extends StatelessWidget {
  final String videoUrl;

  VideoPlayerScreen(this.videoUrl) : super();

  @override
  Widget build(BuildContext context) {
    return YoYoPlayer(
      aspectRatio: 9 / 16,
      url: 'http://192.168.43.29:9000/media/video/$videoUrl/hls.m3u8',
      onfullscreen: () => ,
      videoStyle: VideoStyle(
        play: Icon(Icons.pause),
        pause: Icon(Icons.pause),
        fullscreen: Icon(Icons.fullscreen),
        forward: Icon(Icons.skip_next),
        backward: Icon(Icons.skip_previous),
      ),
      videoLoadingStyle: VideoLoadingStyle(),
    );
  }
}
*/
