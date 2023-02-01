part of '../inmat_api.dart';

class AccountApi {
  /// 마이페이지 조회 API
  Future<Map<String, dynamic>> getProfile(String token) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "프로필 불러오기",
      url: "/users/profiles",
      token: token,
      // deviceIdentifier: "dart_pad",
    );
    return await inMatHttp.execute();
  }

  ///프로필 수정 API
  Future<void> updateProfile({
    required int age,
    required String gender,
    required String nickName,
     String? profileImgUrl,
    required String token,
  }) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.patch,
      message: "프로필 업데이트",
      url: "/users/profiles",
      body: {
        "age": age,
        "gender": gender,
        "nickName": nickName,
        "profileImgUrl": profileImgUrl,
      },
      token: token,
    );
    return await inMatHttp.execute();
  }

  ///내가 하트찜한 음식점 조회 API
  Future<List<Map>> getLikeRestaurants(String token) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "좋아하는 음식점 가져오기",
      url: "/users/restaurants",
      token: token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }

  ///내가 쓴 리뷰 조회 API
  Future<List<Map>> getReviews(String token) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "내가 쓴 리뷰 가져오기",
      url: "/users/reviews",
      token: token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }

  ///내가 쓴 게시글 조회 API
  Future<List<Map>> getPosts(String token) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "내가 쓴 게시물 가져오기",
      url: "/users/posts",
      token: token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }
}
