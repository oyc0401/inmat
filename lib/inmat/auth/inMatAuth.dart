import 'package:restaurant/inmat/inMatAPI/InMatCheckId.dart';
import 'package:restaurant/inmat/inMatAPI/InMatCheckNickname.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';
import 'package:restaurant/inmat/user/inMatUser.dart';
import 'package:restaurant/inmat/user/user_model.dart';

import '../inMatAPI/inMatProfile.dart';
import '../inMatAPI/InMatSignIn.dart';
import '../inMatAPI/inMatupdate.dart';
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

enum AuthStatus {
  user,
  guest,
  reSignIn,
}

class InMatAuth {
  static Future<AuthStatus> initialize() async {
    User? current = InMatUser.instance.currentUser;
    print(current);
    if (current == null) {
      // 비 회원 상태
      print('비 회원 상태');
      return AuthStatus.guest;
    }

    try {
      Map<String, dynamic> profile = await getProfile(current.token);
      await InMatUser.instance.saveUser(profile);
      return AuthStatus.user;
    } on ExpirationAccessToken {
      // 액세스 토큰 만료
    } on AccessDenied {
      // 접근 권한 없음
    } catch (e) {
      // 오류 메세지 띄우기
      print(e);
    }

    //DB 삭제
    InMatUser.instance.deleteUser();

    return AuthStatus.reSignIn;
  }

  static signOut() {
    InMatUser.instance.deleteToken();
    InMatUser.instance.deleteUser();
  }

  static signInEmail({required String id, required String password}) async {
    InMatSignIn sign = InMatSignIn();
    Map<String, dynamic> token = await sign.emailSignIn(user: {
      "username": id,
      "password": password,
    });

    await InMatUser.instance.saveToken(token);
    String accessToken = token['token'];

    // 토큰을 받고 서버의 정보를 얻어온다.
    /// [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만 여기선 로그인 직후에 가져오는 것이라 생략한다.
    Map<String, dynamic> profile = await getProfile(accessToken);

    print(profile);

    await InMatUser.instance.saveUser(profile);

    // 로그인 후 토큰을 받는다.
    // 토큰을 이용해 개인정보를 받는다.
    // 개인정보와 토큰을 DB에 저장한다.
  }

  static Future<Map<String, dynamic>> getProfile(String token) async {
    InMatProfile inMatProfile = InMatProfile();
    return await inMatProfile.getProfile(token: token);
  }

  static registerEmail({
    required String id,
    required String password,
    required Profile profile,
  }) async {
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

    // 회원가입을 한다.
    // 로그인을 한다.
    // 개인정보와 토큰을 DB에 저장한다.
  }

  static checkNickName({
    required String nickName,
  }) async {
    InMatCheckNickName inMatNickName = InMatCheckNickName();
    return await inMatNickName.check(nickName: nickName);
  }

  static checkId({
    required String id,
  }) async {
    InMatCheckId inMatCheckId = InMatCheckId();
    return await inMatCheckId.check(username: id);
  }

  static updateProfile(Map<String, dynamic> user) async {
    InMatUpdate profileUpdate = InMatUpdate();
    String token = InMatUser.instance.currentUser!.token;

    //Map<String, dynamic> current = InMatUser.instance.currentUser!.toUpdateMap();
    // current.addAll(user);
    // print(current);

    Map<String, dynamic> current = user;
    //user['nickName']= user['nickName'] ?? InMatUser.instance.currentUser!.nickName;

    Map m = {
      'profileImgUrl': 'www.dsads.jjj',
      //  'nickName': '하이',
      'age': 20,
      'gender': 'F'
    };
    await profileUpdate.update(token, m);
    // InMatUser.instance.save(current);
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
