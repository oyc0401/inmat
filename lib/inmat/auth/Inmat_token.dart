import 'package:inmat/inmat/auth/model/profile_model.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import '../database/token_database.dart';

import '../inmat_api/inmat_exception.dart';
import 'model/token_model.dart';

/// 토큰은 저장소에서 꺼내진다.
/// 로그인을 하면 토큰에 값이 추가된다.
/// 로그아웃, 회원탈퇴를 하면 토큰이 사라진다.
/// 액세스토큰이 만료되면 서버에 리프레시토큰과 액세스토큰을 보내 액세스토큰을 재발급 받는다.
///

class TokenController {
  TokenModel? _tokenModel;

  TokenModel? get token => _tokenModel;

  final TokenDataBase _tokenDataBase = TokenDataBase();

  Future<void> saveDBToken(TokenModel model) async {
    _tokenDataBase.save(model.toJson());
  }

  void setToken(TokenModel? model) {
    _tokenModel = model;
  }

  void deleteToken() {
    _tokenModel = null;
    _tokenDataBase.delete();
  }

  bool get tokenIsEmpty => _tokenModel == null;
}

enum AuthStatus {
  user,
  guest,
  reSignIn,
}

class InMatProfile extends TokenController {
  ProfileModel? _profileModel;
  late AuthStatus _currentState;

  ProfileModel? get profile => _profileModel;

  AuthStatus get currentState => _currentState;

  void setProfile(ProfileModel model) => _profileModel = model;

  void deleteProfile() => _profileModel = null;

  static Future<InMatProfile> init() async {
    InMatProfile inMatProfile = InMatProfile();

    TokenModel? DBToken = await getTokenInDB();
    inMatProfile.setToken(DBToken);

    if (inMatProfile.tokenIsEmpty) {
      print('비 회원 상태');
      inMatProfile._currentState = AuthStatus.guest;
      return inMatProfile;
    }

    /// 토큰이 있는 상태
    assert(inMatProfile._tokenModel != null);
    try {
      ProfileModel profile = await getProfile(inMatProfile._tokenModel!.token!);
      inMatProfile.setProfile(profile);

      inMatProfile._currentState = AuthStatus.user;
      return inMatProfile;
    } on ExpirationAccessToken {
      // 액세스 토큰 만료
      print("토큰이 만료되었습니다.");
    } on AccessDenied {
      // 접근 권한 없음
      print("접근 권한이 없습니다.");
    } catch (e) {
      // 오류 메세지 띄우기
      print(e);
    }

    /// 토큰이 만료되었으면
    /// DB 삭제
    print("다시 로그인 해주세요.");
    inMatProfile.deleteProfile();
    inMatProfile._currentState = AuthStatus.reSignIn;
    return inMatProfile;
  }

  /// 현재 프로필을 가져온다.


}



Future<ProfileModel> getProfile(String accessToken) async {
  Map<String, dynamic> map =
      await InMatApi.account.getProfile(token: accessToken);

  ProfileModel model = ProfileModel.fromJson(map);
  return model;
}

Future<TokenModel?> getTokenInDB() async {
  TokenDataBase dataBase = TokenDataBase();
  Map<String, dynamic> json = await dataBase.get();
  if (json.isEmpty) {
    return null;
  } else {
    TokenModel token = TokenModel.fromJson(json);
    return token;
  }
}
