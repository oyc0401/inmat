import 'InMatSignIn.dart';
import 'inmatRegisterEmail.dart';
import 'struct.dart';

class InMatAuth {
  static signInEmail({required String id, required String password}) {
    InMatSignIn sign = InMatSignIn();
    sign.emailSignIn(user: {"username": id, "password": password});

    // 로그인 후 토큰을 받는다.
    // 토큰을 이용해 개인정보를 받는다.
    // 개인정보와 토큰을 DB에 저장한다.
  }

  static registerEmail({
    required String id,
    required String password,
    required Profile profile,
  }) {
    InMatRegister register = InMatRegister();
    register.registerEmail(user: {
      "username": id,
      "password": password,
      "age": profile.age,
      "gender": profile.gender,
      "nickName": profile.nickName,
      "phoneNumber": profile.phoneNumber,
    });

    // 회원가입을 한다.
    // 로그인을 한다.
    // 개인정보와 토큰을 DB에 저장한다.
  }
}



void main() {
  InMatAuth.signInEmail(id: "ewqewq", password: "Ewqewq");
  InMatAuth.registerEmail(
    id: "sssad",
    password: "dsaass",
    profile: Profile(
        age: 0, gender: "dassa", nickName: "Dddd", phoneNumber: "phoneNumber"),
  );
}
