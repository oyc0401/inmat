import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class InMatRegister {


  void registerEmail({required Map user}) async {
    Uri uri = Uri.parse("http://prod.sogogi.shop:9000/users/signup");

    Map map = {
      "age": 10,
      "gender": "M",
      "nickName": "초코맛",
      "password": "qwe12345&&",
      "phoneNumber": "010-1234-1844",
      "username": "test123"
    };

    var body = json.encode(map);
    final Response response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        //HttpHeaders.authorizationHeader: "Basic $token"
      },
      body: body,
    );

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception(
          'Failed to load post ${response.statusCode}');
    }
  }
}
