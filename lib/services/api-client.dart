import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  static const host = '192.168.43.29';
  static const port = 9000;

  dynamic requestFeed() async {
    final q = {
      'populate': 'true',
      'approved': 'true',
    };
    final uri = Uri.http('$host:$port', '/topic', q);
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
