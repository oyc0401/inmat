import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class InMatUserDataBase {
  Future<void> save(Map<String, dynamic> user) async {
    UserDB db = await UserDB.Instance();
    db.save(user);
  }

  // Future<void> update(Map<String, dynamic> user) async {
  //   UserDB db = await UserDB.Instance();
  //   db.update(user);
  // }

  Future<Map<String, dynamic>> get() async {
    UserDB db = await UserDB.Instance();
    return db.get();
  }
}

class UserDB {
  late SharedPreferences prefs;

  static Instance() async {
    UserDB key = UserDB();
    key.prefs = await SharedPreferences.getInstance();
    return key;
  }

  void save(Map<String, dynamic> user) {
    prefs.setString("user_json", jsonEncode(user));
    // prefs.setInt('age', user['age']);
    // prefs.setString('gender', user['gender']);
    // prefs.setString('nickName', user['nickName']);
    // prefs.setString('profileImgUrl', user['profileImgUrl']);
    // prefs.setString('token', user['token']);
  }

  // void update(Map<String, dynamic> user) {
  //   if (user['age'] != null) prefs.setInt('age', user['age']);
  //   if (user['gender'] != null) prefs.setString('gender', user['gender']);
  //   if (user['nickName'] != null) prefs.setString('nickName', user['nickName']);
  //   if (user['profileImgUrl'] != null)
  //     prefs.setString('profileImgUrl', user['profileImgUrl']);
  //   if (user['token'] != null) prefs.setString('token', user['token']);
  // }

  Map<String, dynamic> get() {
    String j = prefs.getString("user_json") ?? "{}";
    return jsonDecode(j);
    // Map<String, dynamic> map = {};
    // Set<String> keys = prefs.getKeys();
    // for (var element in keys) {
    //   map[element] = prefs.get(element);
    // }
    // print(map);
    // return map;
    // return {
    //   'age': prefs.getInt('age') ?? 0,
    //   'gender': prefs.getString('gender') ?? "null",
    //   'nickName': prefs.getString('nickName') ?? "null",
    //   'profileImgUrl': prefs.getString('profileImgUrl') ?? "null",
    //   'token': prefs.getString('token') ?? "null",
    // };
  }
}
