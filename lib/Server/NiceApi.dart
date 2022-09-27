import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class getHttp {
  getHttp({this.uri});

  Uri? uri;

  /// json 얻기
  Future<Map<String, dynamic>> parse() async {
    assert(uri != null, "uri 가 입력되지 않았습니다.");

    uri ??= Uri.parse("");

    // 요청하기
    final Response response = await http.get(uri!);

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }
}


