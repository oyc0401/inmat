import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import '../database/token_database.dart';

import '../inmat_api/inmat_exception.dart';

/// 토큰은 저장소에서 꺼내진다.
/// 로그인을 하면 토큰에 값이 추가된다.
/// 로그아웃, 회원탈퇴를 하면 토큰이 사라진다.
/// 액세스토큰이 만료되면 서버에 리프레시토큰과 액세스토큰을 보내 액세스토큰을 재발급 받는다.
///
class Token {
  Map<String, dynamic> _token = {};

  void set(Map<String, dynamic> token) => _token = token;

  Map<String, dynamic> get() => _token;

  void clear() => _token.clear();

  bool get isEmpty => _token.isEmpty;
}

class TokenController {
  final Token _token = Token();

  Map<String, dynamic> get token => _token.get();

  final TokenDataBase _tokenDataBase = TokenDataBase();

  Future<void> retrieveToken() async {
    Map<String, dynamic> token = await _tokenDataBase.get();
    saveToken(token);
  }

  Future<void> saveToken(Map<String, dynamic> token) async {
    _token.set(token);
    _tokenDataBase.save(token);
  }

  void deleteToken() {
    _token.clear();
    _tokenDataBase.delete();
  }

  bool get isEmpty => _token.isEmpty;
}

enum AuthStatus {
  user,
  guest,
  reSignIn,
}

class InMatProfile extends TokenController {
  final Map<String, dynamic> _profile = {};

  Map<String, dynamic> get profile => _profile;

  void saveUser(Map<String, dynamic> user) => _profile.addAll(user);

  void deleteUser() => _profile.clear();

  late AuthStatus currentState;

  Future<void> init() async {
    await retrieveToken();
    if (token.isEmpty) {
      print('비 회원 상태');
      currentState = AuthStatus.guest;
      return;
    }

    /// 토큰이 있는 상태
    assert(token['token'] != null);
    try {
      await downProfile();
      currentState = AuthStatus.user;
      return;
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
    deleteUser();
    currentState = AuthStatus.reSignIn;
    return;
  }

  /// 현재 프로필을 가져온다.
  static Future<Map<String, dynamic>> getProfile(
      Map<String, dynamic> token) async {
    String accessToken = token['token'];
    return await InMatApi.account.getProfile(token: accessToken);
  }

  Future<void> downProfile() async {
    Map<String, dynamic> profile = await getProfile(token);
    saveUser(profile);
  }
}
