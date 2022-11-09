class Token {
  Token({required this.accessToken,  this.refreshToken});
  String accessToken;
  String? refreshToken;
}

class Profile {
  Profile({
    required this.age,
    required this.gender,
    required this.nickName,
    required this.phoneNumber,
  });

  int age;
  String gender;
  String nickName;
  String phoneNumber;
}