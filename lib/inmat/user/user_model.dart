class User {
  User(Map<String, dynamic> user) : _user = user;

  final Map<String, dynamic> _user;

  int get age => _user['age'] ?? 0;

  String get email => _user['email'] ?? "null";

  String get gender => _user['gender'] ?? "null";

  String get nickName => _user['nickName'] ?? "null";

  String get profileImgUrl => _user['profileImgUrl'] ?? "null";

  String get token => _user['token'] ?? "null";

  Map<String, dynamic> toUpdateMap() {
    return {
      "age": age,
      "gender": gender,
      "nickName": nickName,
      "profileImgUrl": profileImgUrl,
    };
  }

  @override
  String toString() {
    return "age: $age, email: $email, gender: $gender, nickName: $nickName, profileImgUrl: $profileImgUrl, token: $token";
  }
}
