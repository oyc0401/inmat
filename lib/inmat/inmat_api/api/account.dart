part of '../inmat_api.dart';

class AccountApi {
  ///로그인 API
  Future<Map<String, dynamic>> emailSignIn({required Map user}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "이메일 로그인",
      url: "/users/login",
      body: user,
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  /// 마이페이지 조회 API
  Future<Map<String, dynamic>> getProfile({required String token}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "프로필 불러오기",
      url: "/users/profiles",
      token: token,
    );
    return await inMatHttp.execute();
  }

  ///회원 가입 API
  Future<void> registerEmail({required Map user}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "회원가입",
      url: "/users/signup",
      body: user,
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///프로필 수정 API
  Future<void> updateProfile(Map user) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.patch,
      message: "프로필 업데이트",
      url: "/users/profiles",
      body: user,
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///아이디 중복 체크 API
  Future<bool> checkId({required String id}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "아이디 중복 체크",
      url: "/users/username",
      body: {'username': id},
      token: InMatAuth.instance.currentUser?.token,
    );
    String message = await inMatHttp.execute();
    return message == "아이디 사용가능!";
  }

  ///닉네임 중복 체크 API
  Future<bool> checkNickName({required String nickName}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "닉네임 중복 체크",
      url: "/users/nickname",
      body: {'nickName': nickName},
      token: InMatAuth.instance.currentUser?.token,
    );
    String message = await inMatHttp.execute();
    // print(message);
    return message == "닉네임 사용가능!";
  }

  ///내가 하트찜한 음식점 조회 API
  Future<List<Map>> getLikeRestaurants() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "좋아하는 음식점 가져오기",
      url: "/users/restaurants",
      token: InMatAuth.instance.currentUser?.token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }

  ///내가 쓴 리뷰 조회 API
  Future<List<Map>> getReviews() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "내가 쓴 리뷰 가져오기",
      url: "/users/reviews",
      token: InMatAuth.instance.currentUser?.token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }

  ///내가 쓴 게시글 조회 API
  Future<List<Map>> getPosts() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "내가 쓴 게시물 가져오기",
      url: "/users/posts",
      token: InMatAuth.instance.currentUser?.token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }
}
