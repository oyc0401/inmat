import '../../auth/inmat_auth.dart';
import '../inmat_http.dart';

class InMatPostLike extends InMatHttp {
  Future<void> setLike(int id) async {
    print("좋아요 하는 중...");

    Map response = await publicPost(
      url: "http://prod.sogogi.shop:9000/restaurants/$id/like",
      token: InMatAuth.instance.currentUser!.token,
      body: {},
    );

    if (response['isSuccess'] == false) {
      print("좋아요 하기 실패!");

      if (response['code'] == 401) {
        throw ExpirationAccessToken();
      } else if (response['code'] == 403) {
        throw AccessDenied();
      }

      throw Exception(
          'Failed to load restaurant: ${response['code']}, ${response['message']}');
    }
    print("좋아요 하기 성공!");
    return response["result"];
  }
}
