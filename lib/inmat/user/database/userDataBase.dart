import 'package:shared_preferences/shared_preferences.dart';

class InMatUserDataBaseInterface {
  void save(Map<String, dynamic> user) {
    InMatUserDataBase db = InMatUserDataBase.Instance();
    db.save(user);
  }

  Map<String, dynamic> get() {
    InMatUserDataBase db = InMatUserDataBase.Instance();
    return db.get();
  }

}

class InMatUserDataBase {
  late SharedPreferences prefs;

  static Instance() async {
    InMatUserDataBase key = InMatUserDataBase();
    key.prefs = await SharedPreferences.getInstance();
    return key;
  }

  //     'age': 0,
  //     'gender': "male",
  //     'nickName': "oyc0401",
  //     'profileImgUrl': "www.image.png",

  void save(Map<String, dynamic> user) {
    prefs.setInt('age', user['age']);
    prefs.setString('gender', user['gender']);
    prefs.setString('nickName', user['nickName']);
    prefs.setString('profileImgUrl', user['profileImgUrl']);
  }

  Map<String, dynamic> get() {
    return {
      'age': prefs.getInt('age'),
      'gender': prefs.getString('gender'),
      'nickName': prefs.getString('nickName'),
      'profileImgUrl': prefs.getString('profileImgUrl'),
    };
  }
}
