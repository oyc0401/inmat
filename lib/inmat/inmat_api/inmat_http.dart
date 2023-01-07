import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class InMatHttp {

  Future<Map> publicGet({required String url, String? token}) async {
    /// TODO 나중에 비회원 처리가 잘 되면 이거 없애도 됌
    token = token ??
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0ZXN0MTIzIiwiYXV0aCI6IlJPTEVfVVNFUiIsI'
            'mV4cCI6MTY3MTkwNjY3N30.7XA_GACOS7qyWWWV-KACZFmzc8l4On_viA9fQRLOWejB_XPjynZjDmebVfiM09TmYigACI7S1JiD-BV5E4Jnfw';

    Uri uri = Uri.parse(url);

    final Response response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return _throwException(response);
  }

  Future<Map> publicPost(
      {required String url, required Map body, String? token}) async {
    /// TODO 나중에 비회원 처리가 잘 되면 이거 없애도 됌
    token = token ??
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0ZXN0MTIzIiwiYXV0aCI6IlJPTEVfVVNFUiIsI'
            'mV4cCI6MTY3MTkwNjY3N30.7XA_GACOS7qyWWWV-KACZFmzc8l4On_viA9fQRLOWejB_XPjynZjDmebVfiM09TmYigACI7S1JiD-BV5E4Jnfw';

    Uri uri = Uri.parse(url);

    String bodyJson = json.encode(body);
    final Response response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: bodyJson,
    );

    return _throwException(response);
  }

  Future<Map> publicPatch(
      {required String url, required Map body, required String token}) async {
    Uri uri = Uri.parse(url);

    var bodyJson = json.encode(body);

    final Response response = await http.patch(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: bodyJson,
    );

    return _throwException(response);
  }


  Map _throwException(Response response) {
    switch (response.statusCode) {
      case 200:
        return json.decode(utf8.decode(response.bodyBytes));
      case 401:
        throw ExpirationAccessToken();
      default:
        throw Exception(
            'Failed to load patch ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
    }
  }

}

class ExpirationAccessToken implements Exception {
  @override
  String toString() => "액세스 토큰이 만료되었습니다.";
}

class SignInFailed implements Exception {
  @override
  String toString() => "없는 아이디이거나 비밀번호가 틀렸습니다.";
}

class AccessDenied implements Exception {
  @override
  String toString() => "접근에 권한이 없습니다.";
}

class OverlappingAccount implements Exception {
  @override
  String toString() => "중복된 아이디입니다.";
}

class OverlappingNickName implements Exception {
  @override
  String toString() => "중복된 닉네임 입니다.";
}

