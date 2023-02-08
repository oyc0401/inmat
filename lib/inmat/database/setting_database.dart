import 'package:inmat/inmat/database/single_database_platform.dart';

class SettingDataBase extends SingleDatabasePlatform {
  SettingDataBase._(super.database);

  static const String key = "setting_json";

  static Future<SettingDataBase> instance() async {
    return SettingDataBase._(await SingleDatabasePlatform.init(key));
  }
}
