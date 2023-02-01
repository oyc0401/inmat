part of '../inmat_api.dart';

class AuthApi {
  ///로그인 API
  Future<Map<String, dynamic>> login({
    required String id,
    required String password,
    required String deviceIdentifier,
  }) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "이메일 로그인",
      url: "/auth/login",
      body: {
        "username": id,
        "password": password,
      },
      deviceIdentifier: deviceIdentifier,
    );
    return await inMatHttp.execute();
  }

  ///익명 로그인 API
  Future<Map<String, dynamic>> loginAnonymous(
    String deviceIdentifier,
  ) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "익명 로그인",
      url: "/auth/login-anonymous",
      deviceIdentifier: deviceIdentifier,
    );
    return await inMatHttp.execute();
  }

  ///토큰 재발급 API
  Future<Map<String, dynamic>> issue({
    required String accessToken,
    required String refreshToken,
    required String deviceIdentifier,
  }) async {
    print("accessToken: $accessToken, refreshToken: $refreshToken");

    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "토큰 재발급",
      url: "/auth/issue",
      token: accessToken,
      refreshToken: refreshToken,
      deviceIdentifier: deviceIdentifier,
    );
    return await inMatHttp.execute();
  }

  // String deviceIdentifier = await MobileId.getMobileId();

  ///회원 가입 API
  Future<void> registerEmail({
    required String id,
    required String password,
    required String email,
    required int age,
    required String gender,
    required String nickName,
    required String phoneNumber,
  }) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "회원가입",
      url: "/auth/signup",
      body: {
        "username": id,
        "password": password,
        "email": email,
        "age": age,
        "gender": gender,
        "nickName": nickName,
        "phoneNumber": phoneNumber,
      },
    );
    return await inMatHttp.execute();
  }

  ///아이디 중복 체크 API
  Future<String> checkId(String id) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "아이디 중복 체크",
      url: "/auth/username",
      body: {'username': id},
    );
    return await inMatHttp.execute();
  }

  ///닉네임 중복 체크 API
  Future<String> checkNickName(String nickName) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "닉네임 중복 체크",
      url: "/auth/nickname",
      body: {'nickName': nickName},
    );
    return await inMatHttp.execute();
  }
}
