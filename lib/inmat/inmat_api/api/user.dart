part of '../inmat_api_library.dart';

class InmatUserApi {
  /// 마이페이지 조회 API
  Future<Map<String, dynamic>> getProfile() async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "프로필 불러오기",
      path: "/users/profiles",
    );
    return await http.execute();
  }

  ///프로필 수정 API
  Future<void> updateProfile({
    required int age,
    required String gender,
    required String nickName,
    String? profileImgUrl,
  }) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.patch,
      message: "프로필 업데이트",
      path: "/users/profiles",
      body: {
        "age": age,
        "gender": gender,
        "nickName": nickName,
        "profileImgUrl": profileImgUrl,
      },
    );
    return await http.execute();
  }

  ///내가 하트찜한 음식점 조회 API
  Future<List<Map<String, dynamic>>> getLikeRestaurants() async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "좋아하는 음식점 가져오기",
      path: "/users/restaurants",
    );
    return (await http.execute()).cast<Map<String, dynamic>>();
  }

  ///내가 쓴 리뷰 조회 API
  Future<List<Map<String, dynamic>>> getReviews() async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "내가 쓴 리뷰 가져오기",
      path: "/users/reviews",
    );
    return (await http.execute()).cast<Map<String, dynamic>>();
  }

  ///내가 쓴 게시글 조회 API
  Future<List<Map<String, dynamic>>> getPosts() async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "내가 쓴 게시물 가져오기",
      path: "/users/posts",
    );
    return (await http.execute()).cast<Map<String, dynamic>>();
  }
}
