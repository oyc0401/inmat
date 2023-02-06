import '../utils/mobile_id.dart';

import 'auth/Inmat_token.dart';
import 'auth/domain/model/profile_model.dart';
import 'auth/domain/model/token_model.dart';
import 'auth/domain/service/database_handler.dart';
import 'auth/domain/service/get_token.dart';
import 'inmat_api/inmat_exception.dart';

class InmatData {
  InmatData();

  // default: guest
  TokenController tokenController = TokenController();
  ProfileController profileController = ProfileController();
  AuthStatus authStatus = AuthStatus.guest;
  late String deviceIdentifier;
  DataBaseHandler db = DataBaseHandler();

  @override
  Future<void> initialize() async {
    return await _init();
  }

  Future<void> _init() async {
    deviceIdentifier = await MobileId.getMobileId();
    // DB 에서 토큰 가져옴.
    TokenModel? DBToken = await GetToken.getTokenInDB();

    if (DBToken != null) {
      try {
        ProfileModel profile = await GetToken.getProfile(DBToken.accessToken);

        tokenController = TokenController(DBToken);
        profileController = ProfileController(profile);
        authStatus = AuthStatus.user;
        return;
      } on ExpirationAccessToken {
        // 액세스 토큰 만료
        print("InMatAuth: 토큰이 만료되었습니다.");
        // 토큰이 만료되었으면
        // DB 삭제
        db.delete();

        print("InMatAuth: 다시 로그인 해주세요.");
        // tokenController = TokenController();
        // profileController = ProfileController();
        authStatus = AuthStatus.reSignIn;
        return;
      } on AccessDenied {
        // 접근 권한 없음
        print("InMatAuth: 접근 권한이 없습니다.");
      } catch (e) {
        // 오류 메세지 띄우기
        print('InMatAuth: $e');
      }
    }

    print('InMatAuth: 비 회원 상태');
    // tokenController = TokenController();
    // profileController = ProfileController();
    // authStatus = AuthStatus.guest;
    return;
  }
}
