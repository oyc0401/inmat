
import '../../auth/inmat_auth.dart';
import '../inmat_http.dart';

class InMatGetCommunity extends InMatHttp {

  Future<List<dynamic>> getHome() async {
    print("커뮤니티 불러오는 중...");

    Map response = await publicGet(
        url: "http://prod.sogogi.shop:9000/communities/",
        token:InMatAuth.instance.currentUser!.token);

    if (response['isSuccess'] == false) {
      print("커뮤니티 불러오기 실패!");

      if (response['code'] == 401) {
        throw ExpirationAccessToken();
      } else if (response['code'] == 403) {
        throw AccessDenied();
      }

      throw Exception(
          'Failed to load home page: ${response['code']}, ${response['message']}');
    }

    print("커뮤니티 불러오기 성공!");
    return response["result"];
  }
}
