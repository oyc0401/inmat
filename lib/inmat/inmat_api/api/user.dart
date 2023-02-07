part of '../inmat_api.dart';

class UserApi {
  /// 마이페이지 조회 API
  Future<Map<String, dynamic>> getProfile(String token) async {
    InMatHttp http = InMatHttp(
      Http.get,
      message: "프로필 불러오기",
      url: "/users/profiles",

      // deviceIdentifier: "dart_pad",
      token: token,
    );
    return await http.execute();
  }

  ///프로필 수정 API
  Future<void> updateProfile({
    required int age,
    required String gender,
    required String nickName,
    String? profileImgUrl,
    required String token,
  }) async {
    InMatHttp http = InMatHttp(
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
    return await http.execute();
  }

  ///내가 하트찜한 음식점 조회 API
  Future<List<Map<String, dynamic>>> getLikeRestaurants(String token) async {
    InMatHttp http = InMatHttp(
      Http.get,
      message: "좋아하는 음식점 가져오기",
      url: "/users/restaurants",
      token: token,
    );
    return (await http.execute()).cast<Map<String, dynamic>>();
  }

  ///내가 쓴 리뷰 조회 API
  Future<List<Map<String, dynamic>>> getReviews(String token) async {
    InMatHttp http = InMatHttp(
      Http.get,
      message: "내가 쓴 리뷰 가져오기",
      url: "/users/reviews",
      token: token,
    );
    return (await http.execute()).cast<Map<String, dynamic>>();
  }

  ///내가 쓴 게시글 조회 API
  Future<List<Map<String, dynamic>>> getPosts(String token) async {
    InMatHttp http = InMatHttp(
      Http.get,
      message: "내가 쓴 게시물 가져오기",
      url: "/users/posts",
      token: token,
    );
    return (await http.execute()).cast<Map<String, dynamic>>();
  }
}
