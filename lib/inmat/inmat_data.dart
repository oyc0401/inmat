// part of 'inmat_library.dart';

import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';
import 'package:inmat/inmat/service/get_token.dart';

import 'exception/inmat_exception.dart';

import 'inmat_local_interface.dart';
import 'models/profile_model.dart';

enum AuthStatus {
  user,
  guest,
  reSignIn,
}


class InmatData {
  InmatData(this.local);

  InmatLocalInterface local;

  // default: guest
  Profile? _profileModel;
  Profile? get profile => _profileModel;
  void setProfile(Profile model) => _profileModel = model;
  void clearProfile() => _profileModel = null;


  AuthStatus authStatus = AuthStatus.guest;

  Future<void> initialize() async {
    return await _init();
  }

  Future<void> _init() async {
    if (!local.tokenIsEmpty) {
      try {
        Profile profile = await GetToken.getProfile();

        setProfile(profile);
        authStatus = AuthStatus.user;
        return;
      } on ExpirationAccessToken {
        // 토큰 만료
        print("InmatData: 토큰이 만료되었습니다.");
        // 토큰이 만료되었으면

        print("InmatData: 다시 로그인 해주세요.");
        // DB 삭제
        local.clearToken();
        clearProfile();
        authStatus = AuthStatus.reSignIn;
        return;
      } on AccessDenied {
        // 접근 권한 없음
        print("InmatData: 접근 권한이 없습니다.");
      } catch (e) {
        // 오류 메세지 띄우기
        print('InmatData: $e');
      }
    }

    print('InmatData: 비 회원 상태');
    local.clearToken();
    clearProfile();
    authStatus = AuthStatus.guest;
    return;
  }
}
