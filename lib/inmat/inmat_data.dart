part of 'inmat_library.dart';

class InmatData {
  InmatData();

  // default: guest
  TokenController tokenController = TokenController();
  ProfileController profileController = ProfileController();
  AuthStatus authStatus = AuthStatus.guest;
  late String deviceIdentifier;
  DataBaseHandler db = DataBaseHandler();


  Future<void> initialize() async {
    return await _init();
  }

  Future<void> _init() async {
    deviceIdentifier = await MobileId.getMobileId();
    // DB 에서 토큰 가져옴.
    TokenModel? DBToken = await GetToken.getTokenInDB();

    if (DBToken != null) {
      try {
        TokenModel newToken =
            await RefreshTokenIssue.getValidToken(DBToken, deviceIdentifier);

        ProfileModel profile = await GetToken.getProfile(newToken.accessToken);

        tokenController = TokenController(newToken);
        profileController = ProfileController(profile);
        authStatus = AuthStatus.user;
        return;
      } on ExpirationAccessToken {
        // 액세스 토큰 만료
        print("InmatData: 토큰이 만료되었습니다.");
        // 토큰이 만료되었으면
        // DB 삭제
        db.delete();

        print("InmatData: 다시 로그인 해주세요.");
        // tokenController = TokenController();
        // profileController = ProfileController();
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
    // tokenController = TokenController();
    // profileController = ProfileController();
    // authStatus = AuthStatus.guest;
    return;
  }
}
