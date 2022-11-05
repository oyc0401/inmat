
import 'user.dart';

class InMatUser {

 InMatUser._();

  static InMatUser get instance {
    return InMatUser._();
  }

  static User? _st;

  User? get getUser {
    return _st;
  }

  save(User u) async {
    _st = u;
    putDataBase();
  }

  changeProfile({
    int? age,
    String? gender,
    String? nickName,
    String? profileImgUrl,
  }) async {
    User? currentUser = getUser;
    assert(currentUser != null, "현재 유저 정보가 없습니다.");

    if (currentUser != null) {
      User newUser = User(
        age: age ?? currentUser.age,
        gender: gender ?? currentUser.gender,
        nickName: nickName ?? currentUser.nickName,
        profileImgUrl: profileImgUrl ?? currentUser.profileImgUrl,
      );

      save(newUser);
    }
  }

  putDataBase() async {}
}

void main() {
  User user1 = User(
    age: 0,
    gender: "male",
    nickName: "oyc0401",
    profileImgUrl: "www.image.png",
  );


  InMatUser.instance.save(user1);

  User? user = InMatUser.instance.getUser;

  String n = user!.nickName;
  n = "새거";

  print(user1);
  print(InMatUser.instance.getUser);
  print(user);

  // InMatUser._save(user1);
}
