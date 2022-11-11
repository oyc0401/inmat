import 'package:restaurant/inmat/user/database/userDataBase.dart';
import 'package:restaurant/inmat/user/update/update.dart';

import 'instance/InMatInstance.dart';
import 'user_model.dart';

class InMatUser {
  InMatUser._();

 static downLoad(){
    _user1=InMatInstance();
  }

  static InMatUser get instance {
    return InMatUser._();
  }

  static InMatInstance _user1=InMatInstance();

  User? get currentUser {
    if (_user1 == null) {
      return null;
    }
    return User(_user1!.user);
  }

  save(Map<String, dynamic> user) async {
    _user1!.user = user;
    putDataBase(user);
  }

  update(Map<String, dynamic> user) async {
    // User? user = currentUser;
    // assert(user != null, "현재 유저 정보가 없습니다.");
    InMatUpdate profileUpdate = InMatUpdate();
    profileUpdate.update(user);
    //

    if (_user1 != null) {
      _user1!.user.addAll(user);
    }
  }

  putDataBase(Map<String, dynamic> user) async {
    InMatUserDataBaseInterface interface = InMatUserDataBaseInterface();
    interface.save(user);
  }
}

void main() {
  // InMatUser.instance.save({
  //   "age": 0,
  //   'gender': "male",
  //   'nickName': "oyc0401",
  //   'profileImgUrl': "www.image.png",
  // });
  //
  // User? user = InMatUser.instance.currentUser;
  //
  // String n = user!.nickName;
  // n = "새거";
  //
  // print(InMatUser.instance.currentUser);
  // print(user);
  Map m1 = {
    "age": 0,
    'gender': "male",
    'nickName': "oyc0401",
    'profileImgUrl': "www.image.png",
  };

  Map m2 = {
    "age": 40,
  };

  m1.addAll(m2);

  print(m1);

  // InMatUser._save(user1);
}
