import 'package:inmat/inmat/inmat_api/inmat_api.dart';

class InMatAccount {
  static registerEmail({
    required String id,
    required String password,
    required Profile profile,
  }) async {
    await InMatApi.account.registerEmail(
      user: {
        "username": id,
        "password": password,
        "email": profile.email,
        "age": profile.age,
        "gender": profile.gender,
        "nickName": profile.nickName,
        "phoneNumber": profile.phoneNumber,
      },
    );

    // 회원가입을 한다.
    // 로그인을 한다.
    // 개인정보와 토큰을 DB에 저장한다.
  }

  static Future<bool> checkNickName({
    required String nickName,
  }) async {
    return await InMatApi.account.checkNickName(nickName: nickName);
  }

  static Future<bool> checkId({
    required String id,
  }) async {
    return await InMatApi.account.checkId(id: id);
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
