import 'package:http/http.dart';

import '../../auth/inmat_auth.dart';
import '../inmat_http.dart';

class InMatWriteComment extends InMatHttp {
  Future<void> sendComment(int id,String comment) async {
    print("댓글 쓰는 중...");

    Map response = await publicPost(
      url: "http://prod.sogogi.shop:9000/communities/$id/details/comment",
      token: InMatAuth.instance.currentUser!.token,
      body: {"contents": comment},
    );

    if (response['isSuccess'] == false) {
      print("댓글 쓰기 실패!");

      if (response['code'] == 401) {
        throw ExpirationAccessToken();
      } else if (response['code'] == 403) {
        throw AccessDenied();
      }

      throw Exception(
          'Failed to load home page: ${response['code']}, ${response['message']}');
    }

    print("댓글 쓰기 성공!");
  }
}
