import 'domain/model/profile_model.dart';
import 'domain/model/token_model.dart';

/// 토큰은 저장소에서 꺼내진다.
/// 로그인을 하면 토큰에 값이 추가된다.
/// 로그아웃, 회원탈퇴를 하면 토큰이 사라진다.
/// 액세스토큰이 만료되면 서버에 리프레시토큰과 액세스토큰을 보내 액세스토큰을 재발급 받는다.
///

class TokenController {
  TokenController([this._tokenModel]);


  TokenModel? _tokenModel;

  TokenModel? get token => _tokenModel;

  void set(TokenModel? model) => _tokenModel = model;

  void clear() => _tokenModel = null;

  bool get tokenIsEmpty => _tokenModel == null;
}

enum AuthStatus {
  user,
  guest,
  reSignIn,
}

class ProfileController {
  ProfileController([this._profileModel]);

  ProfileModel? _profileModel;

  ProfileModel? get profile => _profileModel;

  void set(ProfileModel model) => _profileModel = model;

  void clear() => _profileModel = null;
}
