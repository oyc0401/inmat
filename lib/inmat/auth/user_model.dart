class User {
  User({
    required Map<String, dynamic> user,
    required Map<String, dynamic> token,
  }) : _user = user {
    _user.addAll(token);
  }

  final Map<String, dynamic> _user;

  int get age => _user['age'] ?? 0;

  String get email => _user['email'] ?? "null";

  String get gender => _user['gender'] ?? "null";

  String get nickName => _user['nickName'] ?? "null";

  String get profileImgUrl => _user['profileImgUrl'] ?? "null";

  String get token => _user['token'] ?? "null";

  Map<String, dynamic> toMap() {
    Map<String, dynamic> newMap={};
    newMap.addAll(_user);
    newMap.remove('token');

    return newMap;
  }

  @override
  String toString() {
    return "age: $age, email: $email, gender: $gender, nickName: $nickName, profileImgUrl: $profileImgUrl, token: $token";
  }
}



class UUU{



  int _age;
  String _email;

  UUU(this._age, this._email);

  String get email => _email;

  int get age => _age;
}
