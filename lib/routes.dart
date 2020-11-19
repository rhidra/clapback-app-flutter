import 'package:clapback_app/screens/feed/feed.dart';
import 'package:flutter/widgets.dart';

Map<String, WidgetBuilder> appRoutes() {
  return {
    "/": (BuildContext context) => Feed(),
  };
}
