import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class InMatHttp {
  Future<Map> publicGet({required String url, String? token}) async {

    /// TODO 나중에 비회원 처리가 잘 되면 이거 없애도 됌
    token = token ??
        'eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJ0ZXN0MTIzIiwiYXV0aCI6IlJPTEVfVVNFUiIs'
            'ImV4cCI6MTY3MTgxOTY1MH0.TtzZf1TkBLek2HNWRJZ27sffryM0dfaSk_Z4GXKgHSSz0'
            'uoCsm8ib3hz8SOZ_PIUwCOjXDHSJdQMJIdSHP1UmA';
    Uri uri = Uri.parse(url);

    final Response response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      // print(json.decode(utf8.decode(response.bodyBytes)));
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception(
          'Failed to load get ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
    }
  }

  Future<Map> publicPost({required String url, required Map body}) async {
    Uri uri = Uri.parse(url);

    var bodyJson = json.encode(body);
    final Response response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
      },
      body: bodyJson,
    );

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception(
          'Failed to load post ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
    }
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

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception(
          'Failed to load patch ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
    }
  }
}

class ExpirationAccessToken implements Exception {
  @override
  String toString() {
    return "액세스 토큰이 만료되었습니다.";
  }
}

class SignInFailed implements Exception {
  @override
  String toString() {
    return "없는 아이디이거나 비밀번호가 틀렸습니다.";
  }
}

class AccessDenied implements Exception {
  @override
  String toString() {
    return "접근에 권한이 없습니다.";
  }
}

class OverlappingAccount implements Exception {
  @override
  String toString() {
    return "중복된 아이디입니다.";
  }
}

class OverlappingNickName implements Exception {
  @override
  String toString() {
    return "중복된 닉네임 입니다.";
  }
}

void main() async {
  Uri uri = Uri.parse("http://prod.sogogi.shop:9000/users/signup");

  var bodyJson = json.encode({
    "username": "dsadas",
    "email": "dsadas@gmail.com",
    "password": "dsaadsa321?",
    "age": 0,
    "gender": "M",
    "nickName": "한글",
    "phoneNumber": "010-2323-2323",
  });
  final Response response = await http.post(
    uri,
    headers: {
      "Content-Type": "application/json",
      'Accept': 'application/json',
      //HttpHeaders.authorizationHeader: "Basic $token"
    },
    body: bodyJson,
  );
  print(bodyJson);

  // 요청 성공하면 리턴
  if (response.statusCode == 200) {
    print(json.decode(utf8.decode(response.bodyBytes)));
    return json.decode(utf8.decode(response.bodyBytes));
  } else {
    throw Exception(
        'Failed to load post ${response.statusCode}, ${utf8.decode(response.bodyBytes)}');
  }
}
