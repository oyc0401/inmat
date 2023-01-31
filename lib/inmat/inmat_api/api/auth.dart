part of '../inmat_api.dart';

class AuthApi {
  ///로그인 API
  Future<Map<String, dynamic>> login(
      {required String id, required String password, }) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "이메일 로그인",
      url: "/auth/login",
      body: {
        "username": id,
        "password": password,
      },
    );
    return await inMatHttp.execute();
  }

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
  Future<String> checkId({required String id}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "아이디 중복 체크",
      url: "/auth/username",
      body: {'username': id},
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///닉네임 중복 체크 API
  Future<String> checkNickName({required String nickName}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "닉네임 중복 체크",
      url: "/auth/nickname",
      body: {'nickName': nickName},
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }



}
