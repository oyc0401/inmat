import '../../auth/inmat_auth.dart';
import '../inmat_http.dart';

class AccountApi {
  ///로그인 API
  Future<Map<String, dynamic>> emailSignIn({required Map user}) async {
    InMatHttp inMatHttp = InMatHttp(Http.post,
        message: "이메일 로그인",
        url: "http://prod.sogogi.shop:9000/users/login",
        body: user,
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }

  /// 마이페이지 조회 API
  Future<Map<String, dynamic>> getProfile({required String token}) async {
    InMatHttp inMatHttp = InMatHttp(Http.get,
        message: "프로필 불러오기",
        url: "http://prod.sogogi.shop:9000/users/profiles",
        token: token);
    return await inMatHttp.execute();
  }

  ///회원 가입 API
  Future<void> registerEmail({required Map user}) async {
    InMatHttp inMatHttp = InMatHttp(Http.post,
        message: "회원가입",
        url: "http://prod.sogogi.shop:9000/users/signup",
        body: user,
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }

  ///프로필 수정 API
  Future<void> updateProfile(Map user) async {
    InMatHttp inMatHttp = InMatHttp(Http.patch,
        message: "프로필 업데이트",
        url: "http://prod.sogogi.shop:9000/users/profiles",
        body: user,
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }

  ///아이디 중복 체크 API
  Future<bool> checkId({required String id}) async {
    InMatHttp inMatHttp = InMatHttp(Http.post,
        message: "아이디 중복 체크",
        url: "http://prod.sogogi.shop:9000/users/username",
        body: {'username': id},
        token: InMatAuth.instance.currentUser?.token);
    String message = await inMatHttp.execute();
    return message == "아이디 사용가능!";
  }

  ///닉네임 중복 체크 API
  Future<bool> checkNickName({required String nickName}) async {
    InMatHttp inMatHttp = InMatHttp(Http.post,
        message: "닉네임 중복 체크",
        url: "http://prod.sogogi.shop:9000/users/nickname",
        body: {'nickName': nickName},
        token: InMatAuth.instance.currentUser?.token);
    String message = await inMatHttp.execute();
    print(message);
    return message == "닉네임 사용가능!";
  }
}
