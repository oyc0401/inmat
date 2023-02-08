import 'single_database.dart';

class SingleDatabasePlatform {
  SingleDatabasePlatform(this.database);

  SingleDatabase database;

  static Future<SingleDatabase> init(String key)async{
   return await SingleDatabase.instance(key);
  }

  Map<String, dynamic> read() {
    return database.get();
  }

  void save(Map<String, dynamic> json) {
    database.save(json);
  }

  void delete() {
    database.delete();
  }
}
