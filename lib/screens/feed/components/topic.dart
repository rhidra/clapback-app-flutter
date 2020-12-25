import 'package:clapback_app/components/error.dart';
import 'package:clapback_app/components/video-player.dart';
import 'package:clapback_app/models/panel.dart';
import 'package:clapback_app/models/topic.dart';
import 'package:clapback_app/services/api-client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopicWidget extends StatefulWidget {
  final Topic topic;

  TopicWidget({Key key, this.topic}) : super(key: key);

  @override
  _TopicWidgetState createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  PageController _pageCtrl;

  @override
  void initState() {
    super.initState();
    _pageCtrl = PageController(initialPage: 1);
  }

  @override
  void dispose() {
    _pageCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _pageCtrl,
          scrollDirection: Axis.horizontal,
          children: [
            _buildPanel(widget.topic.leftPanel),
            _buildPanel(widget.topic.centerPanel),
            _buildPanel(widget.topic.rightPanel),
          ],
        ),
        Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment(1, .5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  child: _buildSideButton(
                    icon: Icons.share,
                    onPressed: () {},
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Padding(
                  child: _buildSideButton(
                    icon: Icons.favorite,
                    onPressed: () {},
                  ),
                  padding: EdgeInsets.all(10),
                ),
                Padding(
                  child: _buildSideButton(
                    icon: Icons.fast_rewind,
                    onPressed: () {},
                  ),
                  padding: EdgeInsets.all(10),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPanel(Panel panel) {
    final int type = panel.type;

    if (type == Panel.VIDEO) {
      return _buildVideoPanel(panel);
    } else if (type == Panel.TEXT) {
      return _buildTextPanel(panel);
    } else if (type == Panel.QUIZ) {
      return _buildQuizPanel(panel);
    } else {
      return ErrorScreen(error: 'Unknown panel type !');
    }
  }

  Widget _buildVideoPanel(Panel panel) {
    return Align(
      alignment: Alignment.topCenter,
      child: VideoPlayerScreen(panel.video),
    );
  }

  Widget _buildTextPanel(Panel panel) {
    return ColoredBox(
      color: Colors.white,
      child: Column(
        children: [
          // Image
          Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 3),
            child: CachedNetworkImage(
              imageUrl: ApiClient.formatMedia(panel.image, 'image'),
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
                  panel.text,
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

  Widget _buildQuizPanel(Panel panel) {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildSideButton({IconData icon, Function onPressed}) {
    return Ink(
      child: IconButton(
        icon: Icon(icon),
        color: Color(0xFF222222),
        onPressed: onPressed,
      ),
      decoration: ShapeDecoration(
        color: Color(0x88FFFFFF),
        shape: CircleBorder(),
        shadows: [BoxShadow(blurRadius: 2, color: Color(0x77000000))],
      ),
    );
  }
}
