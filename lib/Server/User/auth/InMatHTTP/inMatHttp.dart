import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class InMatHttp {
  Future<Map> publicPost({required String url, required Map body}) async {
    Uri uri = Uri.parse(url);

    var bodyJson = json.encode(body);
    final Response response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        //HttpHeaders.authorizationHeader: "Basic $token"
      },
      body: bodyJson,
    );

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post ${response.statusCode}');
    }
  }
}
