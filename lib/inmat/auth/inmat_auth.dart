import 'package:inmat/inmat/auth/model/profile_model.dart';
import 'package:inmat/inmat/auth/model/token_model.dart';
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
    if (_currentProfile.tokenIsEmpty) {
      return null;
    }
    return User(
      profileModel: _currentProfile.profile,
      tokenModel: _currentProfile.token,
    );
  }

  /// Make [InMatAuth.instance]
  /// Should execute before use [InMatAuth]
  static Future<void> initialize() async {
    InMatProfile profile = await InMatProfile.init();

    _instance = InMatAuth._privateConstructor(profile);
  }

  /// 로그아웃
  void signOut() {
    _currentProfile.deleteToken();
    _currentProfile.deleteProfile();
  }

  /// 로그인 후 토큰을 받는다.
  /// 토큰을 DB에 저장한다.
  /// 토큰을 이용해 개인정보를 받는다.
  /// 개인정보와 토큰을 DB에 저장한다.
  Future<void> signInEmail(String id, String password) async {
    Map<String, dynamic> json = await InMatApi.account.emailSignIn(
      id: id,
      password: password,
    );
    TokenModel tokenModel = TokenModel.fromJson(json);

    _currentProfile.setToken(tokenModel);
    await _currentProfile.saveDBToken(tokenModel);

    // [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만 여기선 로그인 직후에 가져오는 것이라 생략한다.
    ProfileModel profile = await getProfile(tokenModel.token);
    _currentProfile.setProfile(profile);
  }

  /// 프로필 정보를 업데이트 한다. (작업 중)
  Future<void> updateProfile({
    required int age,
    required String gender,
    required String nickName,
    required String? profileImgUrl,
  }) async {
    await InMatApi.account.updateProfile(
        age: age,
        gender: gender,
        nickName: nickName,
        profileImgUrl: profileImgUrl);
    _currentProfile.setProfile(
      ProfileModel(
          age: age,
          gender: gender,
          nickName: nickName,
          profileImgUrl: profileImgUrl),
    );
  }
}
