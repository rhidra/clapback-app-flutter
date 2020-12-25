library env;

import 'package:flutter/foundation.dart';

const String protocol = kReleaseMode ? 'https' : 'http';
const String host =
    kReleaseMode ? 'api.clapbacktheapp.com' : /*'192.168.43.243'*/ '10.0.2.2';
const int port = kReleaseMode ? 443 : 9000;
