import '../../auth/inmat_auth.dart';
import '../inmat_http.dart';

class InMatGetCommunityOnce extends InMatHttp {
  Future<Map<String, dynamic>> getPost(int id) async {
    print("게시물 불러오는 중...");

    Map response = await publicGet(
        url: "http://prod.sogogi.shop:9000/communities/$id",
        token: InMatAuth.instance.currentUser!.token);

    if (response['isSuccess'] == false) {
      print("게시물 불러오기 실패!");

      if (response['code'] == 401) {
        throw ExpirationAccessToken();
      } else if (response['code'] == 403) {
        throw AccessDenied();
      }

      throw Exception(
          'Failed to load home page: ${response['code']}, ${response['message']}');
    }

    print("게시물 불러오기 성공!");
    return response["result"];
  }
}
