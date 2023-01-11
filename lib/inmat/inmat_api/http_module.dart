import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'inmat_exception.dart';

class HttpModule {
  Future<Map> get({
    required String url,
    String? token,
  }) async {
    final Response response = await http.get(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    _throwHttpException(response);

    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<Map> post({
    required String url,
    required Map? body,
    String? token,
  }) async {
    final Response response = await http.post(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
    );

    _throwHttpException(response);

    return json.decode(utf8.decode(response.bodyBytes));
  }

  Future<Map> patch({
    required String url,
    required Map? body,
    required String? token,
  }) async {
    final Response response = await http.patch(
      Uri.parse(url),
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: json.encode(body),
    );
    _throwHttpException(response);

    return json.decode(utf8.decode(response.bodyBytes));
  }

  void _throwHttpException(Response response) {
    switch (response.statusCode) {
      case 200:
        return;
      case 401:
        throw ExpirationAccessToken();
      default:
        throw Exception(
            'unexpected status code: ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
    }
  }
}
