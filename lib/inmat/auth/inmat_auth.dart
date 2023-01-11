import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import 'Inmat_token.dart';
import 'user_model.dart';

class InMatAuth {
  /// SingleTon Pattern
  InMatAuth._privateConstructor(this._currentProfile);

  /// Storage of token, profile
  final InMatProfile _currentProfile;

  /// Initialized InMatAuth
  static late InMatAuth _instance;

  /// Get InMatAuth
  static InMatAuth get instance => _instance;

  /// Start status
  AuthStatus get status => _currentProfile.currentState;

  /// Return current user
  /// if return null, you haven't token
  User? get currentUser {
    if (_currentProfile.isEmpty) {
      return null;
    }
    return User(user: _currentProfile.profile, token: _currentProfile.token);
  }

  /// Make [InMatAuth.instance]
  /// Should execute before use [InMatAuth]
  static Future<void> initialize() async {
    InMatProfile profile = InMatProfile();
    await profile.init();
    _instance = InMatAuth._privateConstructor(profile);
  }

  /// 로그아웃
  void signOut() {
    _currentProfile.deleteToken();
    _currentProfile.deleteUser();
  }

  /// 로그인 후 토큰을 받는다.
  /// 토큰을 이용해 개인정보를 받는다.
  /// 개인정보와 토큰을 DB에 저장한다.
  Future<void> signInEmail(String id, String password) async {
    Map<String, dynamic> token = await InMatApi.account.emailSignIn(
      user: {
        "username": id,
        "password": password,
      },
    );

    await _currentProfile.saveToken(token);

    /// [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만 여기선 로그인 직후에 가져오는 것이라 생략한다.
    await _currentProfile.downProfile();
  }

  /// 프로필 정보를 업데이트 한다. (작업 중)
  Future<void> updateProfile(Map<String, dynamic> user) async {
    // String token = InMatAuth.instance.currentUser!.token;
    await InMatApi.account.updateProfile( user);
    _currentProfile.saveUser(user);
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
