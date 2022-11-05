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

  /// 얕은 복사 때문에 값이 변경 될 수 있어서 final 로 값을 변경할 수 없게 합니다.
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
