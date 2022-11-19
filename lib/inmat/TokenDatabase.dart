import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Token {
  Token(String accessToken) : _accessToken = accessToken;

  final String _accessToken;

  String get accessToken => _accessToken;


  @override
  String toString() {
    return accessToken;
  }
}

class TokenDataBase {
  Future<void> save(String token) async {
    TokenDB db = await TokenDB.Instance();
    db.save(Token(token));
  }

  // Future<void> update(Map<String, dynamic> user) async {
  //   UserDB db = await UserDB.Instance();
  //   db.update(user);
  // }

  Future<Map<String, dynamic>> get() async {
    TokenDB db = await TokenDB.Instance();
    Token? token = db.get();

    if(token==null){
      return {};
    }else{
      return {
        'accessToken':token.accessToken;
      };
    }

  }
}

class TokenDB {
  late SharedPreferences prefs;

  static Instance() async {
    TokenDB key = TokenDB();
    key.prefs = await SharedPreferences.getInstance();
    return key;
  }

  void save(Token token) {
    prefs.setString("accessToken", token.accessToken);
  }

  Token? get() {
    String? accessToken = prefs.getString("accessToken");

    if (accessToken == null) {
      return null;
    }

    return Token(accessToken);
  }
}
