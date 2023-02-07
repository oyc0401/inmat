import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SingleDatabase {
  SingleDatabase._(this.prefs, this.key);

  SharedPreferences prefs;
  String key;

  static Future<SingleDatabase> instance(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SingleDatabase database = SingleDatabase._(prefs, key);
    return database;
  }

  void save(Map<String, dynamic> data) {
    prefs.setString(key, jsonEncode(data));
  }

  Map<String, dynamic> get() {
    String j = prefs.getString(key) ?? "{}";
    return jsonDecode(j);
  }

  void delete() {
    prefs.setString(key, '{}');
  }
}
