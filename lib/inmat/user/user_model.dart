class User {
  User(Map<String, dynamic> user) : _user = user;

  final Map<String, dynamic> _user;

  int get age {
    return _user['age'];
  }

  String get gender => _user['gender'];

  String get nickName => _user['nickName'];

  String get profileImgUrl => _user['profileImgUrl'];



  @override
  String toString() {
    return "age: $age, gender: $gender, nickName: $nickName, profileImgUrl: $profileImgUrl";
  }
}
