import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// class Token {
//   Token(String accessToken) : _accessToken = accessToken;
//
//   final String _accessToken;
//
//   String get accessToken => _accessToken;
//
//   @override
//   String toString() {
//     return accessToken;
//   }
// }

class TokenDataBase {
  Future<void> save(Map<String, dynamic> token) async {
    TokenDB db = await TokenDB.Instance();
    db.save(token);
  }

  Future<Map<String, dynamic>> get() async {
    TokenDB db = await TokenDB.Instance();
    return db.get();
  }

  Future<void> delete() async {
    TokenDB db = await TokenDB.Instance();
    db.delete();
  }
}

class TokenDB {
  late SharedPreferences prefs;

  static Instance() async {
    TokenDB key = TokenDB();
    key.prefs = await SharedPreferences.getInstance();
    return key;
  }

  void save(Map<String, dynamic> token) {
    prefs.setString("token_json", jsonEncode(token));
  }

  Map<String, dynamic> get() {
    String j = prefs.getString("token_json") ?? "{}";
    return jsonDecode(j);
  }

  void delete() {
    prefs.setString("token_json", '{}');
  }

// void save(Token token) {
//   prefs.setString("accessToken", token.accessToken);
// }
//
// Token? get() {
//   String? accessToken = prefs.getString("accessToken");
//
//   if (accessToken == null) {
//     return null;
//   }
//
//   return Token(accessToken);
// }
}
