import 'package:clapback_app/components/video-player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:clapback_app/components/error.dart';
import 'package:clapback_app/models/panel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:clapback_app/services/api-client.dart';

class PanelWidget extends StatelessWidget {
  final Panel _panel;

  PanelWidget(this._panel);

  @override
  Widget build(BuildContext context) {
    final int type = _panel.type;

    if (type == Panel.VIDEO) {
      return _buildVideoPanel(context);
    } else if (type == Panel.TEXT) {
      return _buildTextPanel(context);
    } else if (type == Panel.QUIZ) {
      return _buildQuizPanel(context);
    } else {
      return ErrorScreen(error: 'Unknown panel type !');
    }
  }

  Widget _buildVideoPanel(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: VideoPlayerScreen(_panel.video),
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

  Widget _buildQuizPanel(BuildContext context) {
    return Center(child: CircularProgressIndicator());
  }
}
