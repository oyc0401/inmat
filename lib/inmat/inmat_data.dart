// part of 'inmat_library.dart';

import 'auth/Inmat_token.dart';
import 'inmat_api/inmat_exception.dart';
import 'inmat_core_api.dart';
import 'inmat_local_interface.dart';
import 'models/profile_model.dart';

class InmatData {
  InmatData(this.local);

  InmatLocalInterface local;

  // default: guest
  ProfileController profileController = ProfileController();
  AuthStatus authStatus = AuthStatus.guest;

  Future<void> initialize() async {
    return await _init();
  }

  Future<void> _init() async {
    if (!local.tokenIsEmpty()) {
      try {
        Profile profile = await InmatCoreApi.getProfile();
        profileController = ProfileController(profile);
        authStatus = AuthStatus.user;
        return;
      } on ExpirationAccessToken {
        // 토큰 만료
        print("InmatData: 토큰이 만료되었습니다.");
        // 토큰이 만료되었으면

        print("InmatData: 다시 로그인 해주세요.");
        // DB 삭제
        local.clearToken();
        profileController = ProfileController();
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
    profileController = ProfileController();
    authStatus = AuthStatus.guest;
    return;
  }
}
