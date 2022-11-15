import 'package:restaurant/inmat/user/database/userDataBase.dart';
import 'package:restaurant/inmat/inMatAPI/inMatupdate.dart';

import 'user_model.dart';

class InMatUser {
  InMatUser._();

  static InMatUser get instance {
    return InMatUser._();
  }

  static Map<String, dynamic> _user = {};

  User? get currentUser {
    if(_user.isEmpty){
      return null;
    }
    return User(_user);
  }

  Future<void> downLoad() async {
    InMatUserDataBase interface = InMatUserDataBase();
    Map<String, dynamic> user = await interface.get();
    _user = user;
  }

  save(Map<String, dynamic> user) async {
    _user.addAll(user);
   // _saveDataBase(user);
  }

  // update(Map<String, dynamic> user) async {
  //   InMatUpdate profileUpdate = InMatUpdate();
  //   await profileUpdate.update(user);
  //   _user.addAll(user);
  //   //_saveDataBase(user);
  // }

  // _saveDataBase(Map<String, dynamic> user) async {
  //   InMatUserDataBase interface = InMatUserDataBase();
  //   interface.save(user);
  // }

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
