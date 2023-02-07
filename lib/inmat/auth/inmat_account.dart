import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import '../../utils/mobile_id.dart';

class InMatAccount {
  static registerEmail({
    required String id,
    required String password,
    required age,
    required email,
    required gender,
    required nickName,
    required phoneNumber,
  }) async {
    await InMatPureApi.auth.registerEmail(
      id: id,
      password: password,
      email: email,
      age: age,
      gender: gender,
      nickName: nickName,
      phoneNumber: phoneNumber,
    );
  }

  static Future<bool> checkNickName({
    required String nickName,
  }) async {
    String message = await InMatPureApi.auth.checkNickName(nickName);
    return message == "닉네임 사용가능!";
  }

  static Future<bool> checkId({
    required String id,
  }) async {
    String message = await InMatPureApi.auth.checkId(id);
    return message == "아이디 사용가능!";
  }
}

// class Profile {
//   Profile({
//     required this.age,
//     required this.email,
//     required this.gender,
//     required this.nickName,
//     required this.phoneNumber,
//   });
//
//   int age;
//   String email;
//   String gender;
//   String nickName;
//   String phoneNumber;
// }
