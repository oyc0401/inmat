import 'package:restaurant/inmat/database/token_database.dart';

import 'package:restaurant/inmat/auth/InMatToken.dart';
import 'package:restaurant/inmat/inMatAPI/InMatCheckId.dart';
import 'package:restaurant/inmat/inMatAPI/InMatCheckNickname.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';

import '../inMatAPI/inMatProfile.dart';
import '../inMatAPI/InMatSignIn.dart';
import '../inMatAPI/inMatupdate.dart';
import '../inMatAPI/inmatRegister.dart';

import 'user_model.dart';

enum AuthStatus {
  user,
  guest,
  reSignIn,
}

class InMatAuth {
  /// 싱글톤 패턴
  InMatAuth._privateConstructor();

  static InMatAuth get instance => _instance;

  static final InMatAuth _instance = InMatAuth._privateConstructor();

  /// 저장소
  static InMatProfile currentProfile = InMatProfile();

  /// [_user]가 null 이거나 토큰이 없으면 [null]을 리턴한다.
  /// [currentUser]가 [null]이 아니라는것은 현재 토큰이 존재한다는 뜻이다.
  User? get currentUser {
    if (currentProfile.tokenIsEmpty()) {
      return null;
    }
    return User(
        user: currentProfile.getProfile(), token: currentProfile.getToken());
  }


  /// 앱을 처음 시작할 때 유저 계정이 어떤 상태인지 확인하기 위해 사용한다.
  static Future<AuthStatus> initialize() async {
    User? current = InMatAuth.instance.currentUser;
    if (current == null) {
      // 비 회원 상태
      print('비 회원 상태');
      return AuthStatus.guest;
    }

    try {
      Map<String, dynamic> profile =
          await InMatAuth.instance.getProfile(current.token);
      currentProfile.saveUser(profile);
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

    currentProfile.deleteUser();

    return AuthStatus.reSignIn;
  }


  /// 로그아웃
  void signOut() {
    currentProfile.deleteToken();
    currentProfile.deleteUser();
  }


  /// 로그인 후 토큰을 받는다.
  /// 토큰을 이용해 개인정보를 받는다.
  /// 개인정보와 토큰을 DB에 저장한다.
  Future<void> signInEmail(String id, String password) async {
    InMatSignIn sign = InMatSignIn();
    Map<String, dynamic> token = await sign.emailSignIn(user: {
      "username": id,
      "password": password,
    });

    await currentProfile.saveToken(token);
    String accessToken = token['token'];

    // 토큰을 받고 서버의 정보를 얻어온다.
    /// [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만 여기선 로그인 직후에 가져오는 것이라 생략한다.
    Map<String, dynamic> profile = await getProfile(accessToken);

    await currentProfile.saveUser(profile);
  }


  /// 현재 프로필을 가져온다.
  Future<Map<String, dynamic>> getProfile(String token) async {
    InMatGetProfile inMatProfile = InMatGetProfile();
    return await inMatProfile.getProfile(token: token);
  }


  /// 프로필 정보를 업데이트 한다. (작업 중)
  Future<void> updateProfile(Map<String, dynamic> user) async {
    InMatUpdate profileUpdate = InMatUpdate();
    String token = InMatAuth.instance.currentUser!.token;

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
