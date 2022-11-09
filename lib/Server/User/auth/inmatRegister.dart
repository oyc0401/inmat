import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:restaurant/Server/User/auth/InMatHTTP/inMatHttp.dart';

class InMatRegister {
  Future<void> registerEmail({required Map user}) async {
    InMatHttp inMatHttp = InMatHttp();
    Map response = await inMatHttp.publicPost(
        url: "http://prod.sogogi.shop:9000/users/signup", body: user);

    if (response['isSuccess'] == false) {
      throw Exception(
          'Failed to load sign in: ${response['code']}, ${response['message']}');
    }
  }
}
