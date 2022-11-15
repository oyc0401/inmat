import 'package:restaurant/inmat/inMatAPI/InMatCheckId.dart';
import 'package:restaurant/inmat/inMatAPI/InMatCheckNickname.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';
import 'package:restaurant/inmat/user/inMatUser.dart';

import '../inMatAPI/inMatProfile.dart';
import '../inMatAPI/InMatSignIn.dart';
import '../inMatAPI/inmatRegister.dart';

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

class InMatAuth {
  static signInEmail({required String id, required String password}) async {
    try {
      InMatSignIn sign = InMatSignIn();
      String token =
          await sign.emailSignIn(user: {"username": id, "password": password});
      // await InMatUser.instance.setToken(token);
      print(token);

      // 토큰을 받고 서버의 정보를 얻어온다.
      /// [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만 로그인 직후에 가져오는 것이라 생략한다.
      InMatProfile inMatProfile = InMatProfile();
      Map<String, dynamic> profile =
          await inMatProfile.getProfile(token: token);

      print(profile);
      profile['token'] = token;

      await InMatUser.instance.save(profile);
    } catch (e) {
      print(e);
    }

    // 로그인 후 토큰을 받는다.
    // 토큰을 이용해 개인정보를 받는다.
    // 개인정보와 토큰을 DB에 저장한다.
  }

  static registerEmail({
    required String id,
    required String password,
    required Profile profile,
  }) async {
    try {
      InMatRegister register = InMatRegister();
      await register.registerEmail(user: {
        "username": id,
        "password": password,
        "email": profile.email,
        "age": profile.age,
        "gender": profile.gender,
        "nickName": profile.nickName,
        "phoneNumber": profile.phoneNumber,
      });
    } catch (e) {
      print(e);
    }

    // 회원가입을 한다.
    // 로그인을 한다.
    // 개인정보와 토큰을 DB에 저장한다.
  }

  static checkNickName({
    required String nickName,
  }) async {
    try {
      InMatCheckNickName inMatNickName = InMatCheckNickName();
      return await inMatNickName.check(nickName: nickName);
    } catch (e) {
      print(e);
    }
  }

  static checkId({
    required String id,
  }) async {
    try {
      InMatCheckId inMatCheckId = InMatCheckId();
      return await inMatCheckId.check(username: id);
    } catch (e) {
      print(e);
    }
  }
}

void main() {
  // InMatAuth.registerEmail(
  //   id: "dsadas@gmail.com",
  //   password: "dsaadsa321.",
  //   profile: Profile(
  //       age: 0, gender: "M", nickName: "한글", phoneNumber: "010-2323-2323"),
  // );
}
