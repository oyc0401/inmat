import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class InMatHttp {
  Future<Map> publicGet({required String url, required String token}) async {
    Uri uri = Uri.parse(url);

    final Response response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "X-ACCESS-TOKEN": "$token"
      },
    );

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception(
          'Failed to load get ${response.statusCode}, ${utf8.decode(
              response.bodyBytes)}');
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
          'Failed to load post ${response.statusCode}, ${utf8.decode(
              response.bodyBytes)}');
    }
  }
}


void main() async {
  Uri uri = Uri.parse("http://prod.sogogi.shop:9000/users/signup");

  var bodyJson = json.encode({
    "username":"dsadas",
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
    throw Exception('Failed to load post ${response.statusCode}, ${utf8.decode(
        response.bodyBytes)}');
  }
}


