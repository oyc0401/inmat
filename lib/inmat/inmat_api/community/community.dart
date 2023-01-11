import 'package:inmat/inmat/auth/inmat_auth.dart';

import '../inmat_http.dart';

class CommunityApi {
  ///커뮤니티 조회 API
  Future<List<Map>> getPosts() async {
    InMatHttp inMatHttp = InMatHttp(Http.get,
        message: "커뮤니티 불러오기",
        url: "http://prod.sogogi.shop:9000/communities/",
        token: InMatAuth.instance.currentUser?.token);
    return (await inMatHttp.execute()).cast<Map>();
  }

  ///특정 게시물 조회 API
  Future<Map<String, dynamic>> getPost(int id) async {
    InMatHttp inMatHttp = InMatHttp(Http.get,
        message: "게시물 불러오기",
        url: "http://prod.sogogi.shop:9000/communities/$id",
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }

  ///댓글 작성 API
  Future<void> writeComment(int id, String comment) async {
    InMatHttp inMatHttp = InMatHttp(Http.get,
        message: "댓글 쓰기",
        url: "http://prod.sogogi.shop:9000/communities/$id/details/comment",
        token: InMatAuth.instance.currentUser?.token);
    return await inMatHttp.execute();
  }
}
