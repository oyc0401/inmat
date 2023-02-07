part of '../inmat_api_library.dart';

class InmatRestaurantApi {
  ///홈화면 조회 API
  Future<Map<String, dynamic>> getHome() async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "홈 화면 불러오기",
      path: "/restaurants",
    );

    return await http.execute();
  }

  ///음식점 상세 조회 API
  Future<Map<String, dynamic>> getRestaurant(int id) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "음식점 불러오기",
      path: "/restaurants/$id",
    );

    return await http.execute();
  }

  ///음식점 하트 찜 설정 API
  Future<void> setHeart(int id) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "음식점 하트 설정",
      path: "/restaurants/$id/like",
    );

    return await http.execute();
  }

  ///음식점 하트 찜 해제 API
  Future<void> deleteHeart(int id) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.patch,
      message: "음식점 하트 취소",
      path: "/restaurants/$id/like",
    );

    return await http.execute();
  }

  ///음식점 리뷰 작성 API
  Future<void> writeReview(
      {required int id, required String content, required int star}) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "리뷰 작성",
      path: "/restaurants/$id/reviews",
      body: {
        "contents": content,
        // "imgUrl": "www.test.test",
        "ratingStar": star,
      },
    );

    return await http.execute();
  }

  ///리뷰 상세 조회 API
  Future<Map<String, dynamic>> getReview(
      {required int restaurantId, required int reviewId}) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "리뷰 상세 조회",
      path: "/restaurants/$restaurantId/reviews/$reviewId",
    );

    return await http.execute();
  }

  ///리뷰 리스트 조회 API
  Future<List<Map>> getReviewAll(int restaurantId) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "리뷰 리스트 조회",
      path: "/restaurants/$restaurantId/reviews",
    );

    return (await http.execute()).cast<Map>();
  }

  ///검색어 랭킹 API
  Future<List<Map>> getSearchRank() async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "검색창 랭킹 불러오기",
      path: "/restaurants/search",
    );

    return (await http.execute()).cast<Map>();
  }

  ///검색 결과 API
  Future<List<Map>> getSearchResult(String word) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "검색 결과 불러오기",
      path: "/restaurants/search/result/?query=$word",
      // body: {
      //   "search": word,
      // },
    );

    return (await http.execute()).cast<Map>();
  }

  /// 관리자 페이지

  ///음식점 추가 API
  Future<void> addRestaurant(Map body) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "음식점 추가하기",
      path: "/restaurants",
      body: body,
    );

    return await http.execute();
  }
}
