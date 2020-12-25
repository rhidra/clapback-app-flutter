import 'package:clapback_app/components/video-player.dart';
import 'package:clapback_app/models/panel.dart';
import 'package:clapback_app/models/topic.dart';
import 'package:clapback_app/screens/feed/components/panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TopicWidget extends StatefulWidget {
  final Topic topic;

  TopicWidget({Key key, this.topic}) : super(key: key);

  @override
  _TopicWidgetState createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  PageController _pageCtrl;
  Panel _currentPanel;
  VideoPlayerScreenController _currentVideoCtrl;
  VideoPlayerScreenController _videoCtrlLeft, _videoCtrlCenter, _videoCtrlRight;

  @override
  void initState() {
    super.initState();
    _videoCtrlLeft = VideoPlayerScreenController();
    _videoCtrlCenter = VideoPlayerScreenController();
    _videoCtrlRight = VideoPlayerScreenController();
    _currentPanel = widget.topic.centerPanel;
    _currentVideoCtrl = _videoCtrlCenter;
    _pageCtrl = PageController(initialPage: 1);
    _pageCtrl.addListener(() {
      setState(() {
        try {
          switch (_pageCtrl.page.round()) {
            case 0:
              _currentPanel = widget.topic.leftPanel;
              _currentVideoCtrl = _videoCtrlLeft;
              break;
            case 1:
              _currentPanel = widget.topic.centerPanel;
              _currentVideoCtrl = _videoCtrlCenter;
              break;
            case 2:
              _currentPanel = widget.topic.rightPanel;
              _currentVideoCtrl = _videoCtrlRight;
              break;
            default:
              _currentPanel = null;
              _currentVideoCtrl = null;
          }
        } catch (e) {
          _currentPanel = null;
          _currentVideoCtrl = null;
        }
      });
    });
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
        // Panels
        PageView(
          controller: _pageCtrl,
          scrollDirection: Axis.horizontal,
          children: [
            PanelWidget(widget.topic.leftPanel, _videoCtrlLeft),
            PanelWidget(widget.topic.centerPanel, _videoCtrlCenter),
            PanelWidget(widget.topic.rightPanel, _videoCtrlRight),
          ],
        ),

        // Side buttons
        _buildSideButtons(),

        // Clapback button
        Align(
          alignment: Alignment(.9, .7),
          child: ClipOval(
            child: Material(
              color: Colors.red, // button color
              child: InkWell(
                child: SizedBox(
                  width: 60,
                  height: 60,
                  child: Icon(Icons.message, color: Colors.white),
                ),
                onTap: () {},
              ),
            ),
          ),
        ),

        // Hastag button
        Align(
          alignment: Alignment(-.9, .9),
          child: RaisedButton(
            textColor: Colors.red,
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.red.shade200),
            ),
            child: Text('#${widget.topic.hashtags[0]}'),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildSideButtons() {
    final List<Widget> buttons = [
      _buildSideButton(
        icon: Icons.share,
        onPressed: () {},
      ),
      _buildSideButton(
        icon: Icons.favorite,
        onPressed: () {},
      ),
    ];

    if (_currentPanel != null && _currentPanel.type == Panel.VIDEO) {
      buttons.add(_buildSideButton(
        icon: Icons.fast_rewind,
        onPressed: () {
          _currentVideoCtrl.rewind();
        },
      ));
    }

    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment(1, .1),
        child: Padding(
          padding: EdgeInsets.only(right: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: buttons,
          ),
        ),
      ),
    );
  }

  Widget _buildSideButton({IconData icon, Function onPressed}) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Ink(
        child: SizedBox(
          height: 40,
          child: IconButton(
            icon: Icon(icon),
            color: Color(0xFF222222),
            onPressed: onPressed,
            iconSize: 20,
          ),
        ),
        decoration: ShapeDecoration(
          color: Color(0x88FFFFFF),
          shape: CircleBorder(),
          shadows: [BoxShadow(blurRadius: 2, color: Color(0x77000000))],
        ),
      ),
    );
  }
}
