import 'package:inmat/inmat/auth/inmat_auth.dart';

import '../inmat_http.dart';

class RestaurantApi {

  ///홈화면 조회 API
  Future<Map<String, dynamic>> getHome() async {
    InMatHttp inMatHttp = InMatHttp(Http.get,
        message: "홈 화면 불러오기",
        url: "http://prod.sogogi.shop:9000/restaurants",
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }

  ///음식점 상세 조회 API
  Future<Map<String, dynamic>> getRestaurant(int id) async {
    InMatHttp inMatHttp = InMatHttp(Http.get,
        message: "음식점 불러오기",
        url: "http://prod.sogogi.shop:9000/restaurants/$id",
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }

  ///음식점 하트 찜 설정 API
  Future<void> setHeart(int id) async {
    InMatHttp inMatHttp = InMatHttp(Http.post,
        message: "하트 설정",
        url: "http://prod.sogogi.shop:9000/restaurants/$id/like",
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }

  ///음식점 하트 찜 해제 API
  Future<void> deleteHeart(int id) async {
    InMatHttp inMatHttp = InMatHttp(Http.patch,
        message: "하트 취소",
        url: "http://prod.sogogi.shop:9000/restaurants/$id/like",
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }
}
