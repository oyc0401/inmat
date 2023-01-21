part of '../inmat_api.dart';

class RestaurantApi {
  ///홈화면 조회 API
  Future<Map<String, dynamic>> getHome() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "홈 화면 불러오기",
      url: "/restaurants",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///음식점 상세 조회 API
  Future<Map<String, dynamic>> getRestaurant(int id) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "음식점 불러오기",
      url: "/restaurants/$id",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///음식점 하트 찜 설정 API
  Future<void> setHeart(int id) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "음식점 하트 설정",
      url: "/restaurants/$id/like",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///음식점 하트 찜 해제 API
  Future<void> deleteHeart(int id) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.patch,
      message: "음식점 하트 취소",
      url: "/restaurants/$id/like",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///음식점 리뷰 작성 API
  Future<void> writeReview(
      {required int id, required String content, required int star}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "리뷰 작성",
      url: "/restaurants/$id/reviews",
      body: {
        "contents": content,
        // "imgUrl": "www.test.test",
        "ratingStar": star,
      },
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///리뷰 상세 조회 API
  Future<Map<String, dynamic>> getReview({
    required int restaurantId,
    required int reviewId,
  }) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "리뷰 상세 조회",
      url: "/restaurants/$restaurantId/reviews/$reviewId",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///리뷰 리스트 조회 API
  Future<List<Map>> getReviewAll(int restaurantId) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "리뷰 리스트 조회",
      url: "/restaurants/$restaurantId/reviews",
      token: InMatAuth.instance.currentUser?.token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }

  ///검색어 랭킹 API
  Future<List<Map>> getSearchRank() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "검색창 랭킹 불러오기",
      url: "/restaurants/search",
      token: InMatAuth.instance.currentUser?.token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }

  ///검색 결과 API
  Future<List<Map>> getSearchResult(String word) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "검색 결과 불러오기",
      url: "/restaurants/search/result/?query=$word",
      // body: {
      //   "search": word,
      // },
      token: InMatAuth.instance.currentUser?.token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }

  /// 관리자 페이지

  ///음식점 추가 API
  Future<void> addRestaurant(Map body) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "음식점 추가하기",
      url: "/restaurants",
      body: body,
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }
}

void main() async {
  await InMatApi.restaurant.addRestaurant({
    "address": "미추홀구 1번길 1",
    "contactNumber": "010-1234-5678",
    "imgUrl": "www.test.test",
    "latitude": 36,
    "longitude": 36,
    "restaurantMenuList": [
      {"categoryId": 1, "menuName": "탕수육", "price": 10000}
    ],
    "restaurantName": "테스트 음식점",
    "restaurantType": "FOOD"
  });
}
