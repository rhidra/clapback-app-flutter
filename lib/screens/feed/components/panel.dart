import 'package:clapback_app/components/video-player.dart';
import 'package:clapback_app/screens/feed/components/quiz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:clapback_app/components/error.dart';
import 'package:clapback_app/models/panel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clapback_app/services/api-client.dart';

class PanelWidget extends StatefulWidget {
  final Panel panel;
  final VideoPlayerScreenController videoCtrl;

  PanelWidget(this.panel, [this.videoCtrl]) : super();

  @override
  _PanelWidgetState createState() => _PanelWidgetState(panel, videoCtrl);
}

class _PanelWidgetState extends State<PanelWidget> {
  final Panel _panel;
  final VideoPlayerScreenController _videoCtrl;

  _PanelWidgetState(this._panel, this._videoCtrl);

  @override
  Widget build(BuildContext context) {
    final int type = _panel.type;

    if (type == Panel.VIDEO) {
      return _buildVideoPanel();
    } else if (type == Panel.TEXT) {
      return _buildTextPanel(context);
    } else if (type == Panel.QUIZ) {
      return QuizWidget(_panel.quiz);
    } else {
      return ErrorScreen(error: 'Unknown panel type !');
    }
  }

  Widget _buildVideoPanel() {
    return Align(
      alignment: Alignment.topCenter,
      child: VideoPlayerScreen(_panel.video, _videoCtrl),
    );
  }

  Widget _buildTextPanel(BuildContext context) {
    final double maxImgHeight = MediaQuery.of(context).size.height / 3;

    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          // Image
          Container(
            constraints: BoxConstraints(maxHeight: maxImgHeight),
            child: CachedNetworkImage(
              imageUrl: ApiClient.formatMedia(_panel.image, 'image'),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),

          // Text
          Flexible(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  _panel.text,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuizPanel() {
    return Center(child: CircularProgressIndicator());
  }
}
