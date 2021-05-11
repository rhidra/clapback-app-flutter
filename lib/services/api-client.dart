import 'dart:convert';
import 'dart:io';
import 'package:clapback_app/env.dart' as env;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static String formatMedia(id, type) {
    if (type == 'video') {
      return '${env.protocol}://${env.host}:${env.port}/media/video/$id/hls.m3u8';
    }
    if (type == 'image') {
      return '${env.protocol}://${env.host}:${env.port}/media/image/$id';
    }
    throw Error();
  }

  /// General request to the backend API
  /// - [url]: '/topic'
  /// - [params]: {populate: true}
  dynamic requestGet(String url, [Map<String, String> params]) async {
    final uri = kReleaseMode
        ? Uri.https('${env.host}:${env.port}', url, params)
        : Uri.http('${env.host}:${env.port}', url, params);

    final token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1ZmMzY2NjYTA1N2M4ZDM1N2FkZGU3NzMiLCJlbWFpbCI6ImhlbGxvQGhlbGxvLmNuIiwicGVybWlzc2lvbnMiOlsidXNlciJdLCJpYXQiOjE2MDkxNzkzMTksImV4cCI6MTYwOTE3OTYxOX0.pUPIyUcbYzfGZ5PaDTSb4SRgHOW7DbU2OXwFtN7YFXk';
    final res = await http.get(uri, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    if (res.statusCode < 400) {
      return jsonDecode(res.body);
    } else {
      throw Exception(['Request error', res]);
    }
  }
}
