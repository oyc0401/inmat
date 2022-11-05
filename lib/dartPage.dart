class User {
  User({
    required int age,
    required String gender,
    required String nickName,
    required String profileImgUrl,
  })  : _age = age,
        _gender = gender,
        _nickName = nickName,
        _profileImgUrl = profileImgUrl;

  final int _age;
  final String _gender;
  final String _nickName;
  final String _profileImgUrl;

  int get age => _age;

  String get gender => _gender;

  String get nickName => _nickName;

  String get profileImgUrl => _profileImgUrl;

  // void setAge(int age) => _age = age;
  //
  // void setGender(String gender) => _gender = gender;
  //
  // void setNickName(String nickName) => _nickName = nickName;
  //
  // void setProfileImgUrl(String profileImgUrl) => _profileImgUrl = profileImgUrl;

  @override
  String toString() {
    return "age: $_age, gender: $_gender, nickName: $_nickName, profileImgUrl: $_profileImgUrl";
  }
}

class InMatUser {
  static User? _st;

  static User? get getUser {
    return _st;
  }

  static save(User u) async {
    _st = u;
  }

  static changeProfile({
    int? age,
    String? gender,
    String? nickName,
    String? profileImgUrl,
  }) async {
    User? currentUser = getUser;

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
}

void main() {
  User user1 = User(
    age: 0,
    gender: "male",
    nickName: "oyc0401",
    profileImgUrl: "www.image.png",
  );

  InMatUser.save(user1);

  User? user = InMatUser.getUser;

  String n = user!.nickName;
  n = "새거";

  print(user1);
  print(InMatUser.getUser);
  print(user);

  // InMatUser._save(user1);
}
