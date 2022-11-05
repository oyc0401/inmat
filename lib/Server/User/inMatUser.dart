import 'package:restaurant/Server/User/userDataBase.dart';

import 'user.dart';

class InMatUser {
  InMatUser._();

  static InMatUser get instance {
    return InMatUser._();
  }

  static Map<String, dynamic>? _user;

  User? get currentUser {
    if (_user == null) {
      return null;
    }
    return User(_user!);
  }

  save(Map<String, dynamic> user) async {
    _user = user;
    putDataBase(user);
  }

  update(Map<String, dynamic> user) async {
    User? user = currentUser;
    assert(user != null, "현재 유저 정보가 없습니다.");

    if (user != null) {
      // save(newUser);
    }
  }

  putDataBase(Map<String, dynamic> user) async {
    InMatUserDataBaseInterface interface = InMatUserDataBaseInterface();
    interface.save(user);
  }
}

void main() {
  InMatUser.instance.save({
    "age": 0,
    'gender': "male",
    'nickName': "oyc0401",
    'profileImgUrl': "www.image.png",
  });

  User? user = InMatUser.instance.currentUser;

  String n = user!.nickName;
  n = "새거";

  print(InMatUser.instance.currentUser);
  print(user);

  // InMatUser._save(user1);
}
