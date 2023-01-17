part of '../inmat_api.dart';

class CommunityApi {
  ///커뮤니티 조회 API
  Future<List<Map>> getPosts() async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "커뮤니티 불러오기",
      url: "/communities",
      token: InMatAuth.instance.currentUser?.token,
    );
    return (await inMatHttp.execute()).cast<Map>();
  }

  ///특정 게시물 조회 API
  Future<Map<String, dynamic>> getPost(int id) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.get,
      message: "게시물 불러오기",
      url: "/communities/$id",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///게시글 작성 API
  Future<void> writePost(
      {required String title, required String content}) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "게시글 작성",
      url: "/communities",
      body: {
        "contents": content,
        "topic": title,
      },
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///게시글 삭제 API
  Future<void> deletePost(int postId) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.patch,
      message: "게시글 삭제",
      url: "/communities/$postId/delete",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///댓글 작성 API
  Future<void> writeComment(int id, String comment) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "댓글 쓰기",
      url: "/communities/$id/details/comment",
      body: {
        "contents": comment,
      },
      token: InMatAuth.instance.currentUser?.token,
    );
    var v = await inMatHttp.execute();
    print(v);

    /// ToDo 댓글쓰고 리턴값 받아야함

    return;
  }

  ///게시글 좋아요 API
  Future<void> setHeart(int postId) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.post,
      message: "게시글 하트 설정",
      url: "/communities/$postId/details/like",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }

  ///게시글 좋아요 API
  Future<void> deleteHeart(int postId) async {
    InMatHttp inMatHttp = InMatHttp(
      Http.patch,
      message: "게시글 하트 취소",
      url: "/communities/$postId/details/like/delete",
      token: InMatAuth.instance.currentUser?.token,
    );
    return await inMatHttp.execute();
  }
}
