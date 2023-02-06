// import 'package:inmat/inmat/inmat_api/inmat_api.dart';
// import 'package:inmat/utils/mobile_id.dart';
// import 'package:jwt_decode/jwt_decode.dart';
//
// import '../inmat_api/inmat_exception.dart';
// import 'Inmat_token.dart';
// import 'domain/model/profile_model.dart';
// import 'domain/model/token_model.dart';
// import 'domain/service/database_handler.dart';
// import 'domain/service/get_token.dart';
// import 'user_model.dart';
//
// class InmatAuth {
//   /// Initialized InMatAuth
//   static late InmatAuth _instance;
//
//   /// Get InMatAuth
//   static InmatAuth get instance => _instance;
//
//   /// SingleTon Pattern
//   InmatAuth._(this._tokenController, this._profileController, this._authStatus);
//
//   final TokenController _tokenController;
//   final ProfileController _profileController;
//   final AuthStatus _authStatus;
//   DataBaseHandler db=DataBaseHandler();
//
//   /// Start status
//   AuthStatus get status => _authStatus;
//
//   /// Return current user
//   /// if return null, you haven't token
//   User? get currentUser {
//     if (_tokenController.tokenIsEmpty) {
//       return null;
//     }
//     assert(
//         _profileController.profile != null && _tokenController.token != null);
//
//     return User(
//       profileModel: _profileController.profile!,
//       tokenModel: _tokenController.token!,
//     );
//   }
//
//   /// Make [InmatAuth.instance]
//   /// Should execute before use [InmatAuth]
//   static Future<void> initialize() async => _instance = await _init();
//
//   /// 로그아웃
//   void signOut() {
//     db.delete();
//     _tokenController.clear();
//     _profileController.clear();
//   }
//
//   /// 로그인 후 토큰을 받는다.
//   /// 토큰을 DB에 저장한다.
//   /// 토큰을 이용해 개인정보를 받는다.
//   /// 개인정보와 토큰을 DB에 저장한다.
//   Future<void> signInEmail(String id, String password) async {
//     String deviceIdentifier = await MobileId.getMobileId();
//     TokenModel tokenModel =
//         await GetToken.getTokenEmail(id, password, deviceIdentifier);
//
//     _tokenController.set(tokenModel);
//     await db.saveDBToken(tokenModel);
//
//     // jwt decode
//     String token = tokenModel.accessToken;
//     Map<String, dynamic> payload = Jwt.parseJwt(token);
//     print(payload);
//
//     // [ExpirationAccessToken], [AccessDenied]등 의 예외가 있지만
//     // 여기선 로그인 직후에 가져오는 것이라 생략한다.
//     ProfileModel profile = await GetToken.getProfile(tokenModel.accessToken);
//     _profileController.set(profile);
//   }
//
//   Future<void> regenerateToken() async {
//     TokenModel? token = _tokenController.token;
//     if (token == null) {
//       throw Exception("토큰을 재발급 하려는데 현재 토큰이 없습니다.");
//     }
//
//     String deviceIdentifier = await MobileId.getMobileId();
//     Map<String, dynamic> json = await InMatApi.auth.issue(
//       accessToken: token.accessToken,
//       refreshToken: token.refreshToken,
//       deviceIdentifier: deviceIdentifier,
//     );
//
//     TokenModel newToken = TokenModel.fromJson(json);
//
//     _tokenController.set(newToken);
//   }
//
//   /// 프로필 정보를 업데이트 한다. (프로필 사진은 아직 수정 불가능)
//   Future<void> updateProfile({
//     required int age,
//     required String gender,
//     required String nickName,
//     required String? profileImgUrl,
//   }) async {
//     await InMatApi.user.updateProfile(
//       age: age,
//       gender: gender,
//       nickName: nickName,
//       profileImgUrl: profileImgUrl,
//       token: InmatAuth.instance.currentUser!.accessToken,
//     );
//     _profileController.set(
//       ProfileModel(
//         age: age,
//         gender: gender,
//         nickName: nickName,
//         profileImgUrl: profileImgUrl,
//         phoneNumber: _profileController.profile!.phoneNumber,
//         email: _profileController.profile!.email,
//         userId: _profileController.profile!.userId,
//         username: _profileController.profile!.username,
//       ),
//     );
//   }
//
//   static Future<InmatAuth> _init() async {
//     // DB 에서 토큰 가져옴.
//     TokenModel? DBToken = await GetToken.getTokenInDB();
//
//     if (DBToken != null) {
//       try {
//         ProfileModel profile = await GetToken.getProfile(DBToken.accessToken);
//
//         return InmatAuth._(TokenController(DBToken), ProfileController(profile),
//             AuthStatus.user);
//       } on ExpirationAccessToken {
//         // 액세스 토큰 만료
//         print("InMatAuth: 토큰이 만료되었습니다.");
//         // 토큰이 만료되었으면
//         // DB 삭제
//         DataBaseHandler db=DataBaseHandler();
//         db.delete();
//
//         print("InMatAuth: 다시 로그인 해주세요.");
//         return InmatAuth._(
//             TokenController(), ProfileController(), AuthStatus.reSignIn);
//       } on AccessDenied {
//         // 접근 권한 없음
//         print("InMatAuth: 접근 권한이 없습니다.");
//       } catch (e) {
//         // 오류 메세지 띄우기
//         print('InMatAuth: $e');
//       }
//     }
//
//     print('InMatAuth: 비 회원 상태');
//     return InmatAuth._(
//         TokenController(), ProfileController(), AuthStatus.guest);
//   }
// }
