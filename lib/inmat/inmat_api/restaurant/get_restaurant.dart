import 'package:restaurant/inmat/auth/inmat_auth.dart';

import '../inmat_http.dart';

class InMatGetRestaurant extends InMatHttp {

  Future<Map<String, dynamic>> getRestaurant(int id) async {
    print("음식점 불러오는 중...");

    Map response = await publicGet(
        url: "http://prod.sogogi.shop:9000/restaurants/$id",
        token: InMatAuth.instance.currentUser!.token);

    if (response['isSuccess'] == false) {
      print("음식점 불러오기 실패!");

      if (response['code'] == 401) {
        throw ExpirationAccessToken();
      } else if (response['code'] == 403) {
        throw AccessDenied();
      }

      throw Exception(
          'Failed to load restaurant: ${response['code']}, ${response['message']}');
    }
    print("음식점 불러오기 성공!");
    return response["result"];
  }
}
