import 'package:inmat/inmat/database/single_database_platform.dart';

class DataBaseToken extends SingleDatabasePlatform {
  DataBaseToken._(super.database);

  static const String key = "token_json";

  static Future<DataBaseToken> instance() async {
    return DataBaseToken._(await SingleDatabasePlatform.init(key));
  }
}
