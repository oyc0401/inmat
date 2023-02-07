import 'single_database.dart';

class DataBaseToken {
  final String key = "token_json";

  Future<void> save(Map<String, dynamic> token) async {
    SingleDatabase db = await SingleDatabase.instance(key);
    db.save(token);
  }

  Future<Map<String, dynamic>> get() async {
    SingleDatabase db = await SingleDatabase.instance(key);
    return db.get();
  }

  Future<void> delete() async {
    SingleDatabase db = await SingleDatabase.instance(key);
    db.delete();
  }
}
