import 'package:restaurant/inmat/user/inMatUser.dart';
import 'package:restaurant/inmat/user/instance/InMatInstance.dart';

import 'signin/InMatSignIn.dart';
import 'signin/inmatRegister.dart';

// class Token {
//   Token({required this.accessToken, this.refreshToken});
//
//   String accessToken;
//   String? refreshToken;
// }

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

class InMatAuth {
  static signInEmail({required String id, required String password}) async {
    try {
      InMatSignIn sign = InMatSignIn();
      String token =
          await sign.emailSignIn(user: {"username": id, "password": password});
      setToken(token);
    } catch (e) {
      print(e);
    }

    // 로그인 후 토큰을 받는다.
    // 토큰을 이용해 개인정보를 받는다.
    // 개인정보와 토큰을 DB에 저장한다.
  }

  static setToken(String token) {
    InMatInstance instance = InMatInstance();
    instance.setToken(token);
  }

  static registerEmail({
    required String id,
    required String email,
    required String password,
    required Profile profile,
  }) async {
    try {
      InMatRegister register = InMatRegister();
      await register.registerEmail(user: {
        "email": email,
        "username": id,
        "password": password,
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
}

void main() {
  // InMatAuth.registerEmail(
  //   id: "dsadas@gmail.com",
  //   password: "dsaadsa321.",
  //   profile: Profile(
  //       age: 0, gender: "M", nickName: "한글", phoneNumber: "010-2323-2323"),
  // );
}
