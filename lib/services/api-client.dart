import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static const prot = kReleaseMode ? 'https' : 'http';
  static const host = '192.168.43.29';
  static const port = kReleaseMode ? 443 : 9000;

  static String formatMedia(id, type) {
    if (type == 'video') {
      return '$prot://$host:$port/media/video/$id/hls.m3u8';
    }
    if (type == 'image') {
      return '$prot://$host:$port/media/image/$id';
    }
    throw Error();
  }

  dynamic requestFeed() async {
    final q = {
      'populate': 'true',
      'approved': 'true',
    };
    final uri = kReleaseMode
        ? Uri.https('$host:$port', '/topic', q)
        : Uri.http('$host:$port', '/topic', q);
    final res = await http.get(uri, headers: {
      'Accept': 'application/json',
    });

    if (res.statusCode < 400) {
      final List json = jsonDecode(res.body);
      return json;
    } else {
      throw Exception(['Request error', res]);
    }
  }
}
