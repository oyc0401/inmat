import '../models/profile_model.dart';
import '../models/token_model.dart';

/// 토큰은 저장소에서 꺼내진다.
/// 로그인을 하면 토큰에 값이 추가된다.
/// 로그아웃, 회원탈퇴를 하면 토큰이 사라진다.
/// 액세스토큰이 만료되면 서버에 리프레시토큰과 액세스토큰을 보내 액세스토큰을 재발급 받는다.
///

class TokenController {
  TokenController([this._tokenModel]);


  Token? _tokenModel;

  Token? get token => _tokenModel;

  void set(Token? model) => _tokenModel = model;

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

  Profile? _profileModel;

  Profile? get profile => _profileModel;

  void set(Profile model) => _profileModel = model;

  void clear() => _profileModel = null;
}
