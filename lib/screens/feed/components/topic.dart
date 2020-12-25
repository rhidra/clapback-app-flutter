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
            PanelWidget(widget.topic.leftPanel),
            PanelWidget(widget.topic.centerPanel),
            PanelWidget(widget.topic.rightPanel),
          ],
        ),
        Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment(1, .1),
            child: Padding(
              padding: EdgeInsets.only(right: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildSideButton(
                    icon: Icons.share,
                    onPressed: () {},
                  ),
                  _buildSideButton(
                    icon: Icons.favorite,
                    onPressed: () {},
                  ),
                  _buildSideButton(
                    icon: Icons.fast_rewind,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment(.9, .8),
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
      ],
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
