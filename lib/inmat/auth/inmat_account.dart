import 'package:inmat/inmat/inmat_api/inmat_api.dart';

class InMatAccount {
  static registerEmail({
    required String id,
    required String password,
    required Profile profile,
  }) async {
    await InMatApi.auth.registerEmail(
      id: id,
      password: password,
      email: profile.email,
      age: profile.age,
      gender: profile.gender,
      nickName: profile.nickName,
      phoneNumber: profile.phoneNumber,
    );
  }

  static Future<bool> checkNickName({
    required String nickName,
  }) async {
    String message = await InMatApi.auth.checkNickName(nickName: nickName);
    return message == "닉네임 사용가능!";
  }

  static Future<bool> checkId({
    required String id,
  }) async {
    String message = await InMatApi.auth.checkId(id: id);
    return message == "아이디 사용가능!";
  }
}

class Profile {
  Profile({
    required this.age,
    required this.email,
    required this.gender,
    required this.nickName,
    required this.phoneNumber,
  });

  int age;
  String email;
  String gender;
  String nickName;
  String phoneNumber;
}
