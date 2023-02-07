part of '../inmat_api.dart';

class InmatCommunityApi {
  ///커뮤니티 조회 API
  Future<List<Map>> getPosts() async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "커뮤니티 불러오기",
      path: "/communities",
    );
    return (await http.execute()).cast<Map>();
  }

  ///특정 게시물 조회 API
  Future<Map<String, dynamic>> getPost(int id) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "게시물 불러오기",
      path: "/communities/$id",
    );
    return await http.execute();
  }

  ///게시글 작성 API
  Future<void> writePost(
      {required String title, required String content}) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "게시글 작성",
      path: "/communities",
      body: {
        "contents": content,
        "topic": title,
      },
    );
    return await http.execute();
  }

  ///게시글 삭제 API
  Future<void> deletePost(int postId) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.patch,
      message: "게시글 삭제",
      path: "/communities/$postId/delete",
    );
    return await http.execute();
  }

  ///댓글 작성 API
  Future<void> writeComment(int id, String comment) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "댓글 쓰기",
      path: "/communities/$id/details/comment",
      body: {
        "contents": comment,
      },
    );
    var v = await http.execute();
    print(v);

    /// ToDo 댓글쓰고 리턴값 받아야함

    return;
  }

  ///게시글 좋아요 API
  Future<void> setHeart(int postId) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "게시글 하트 설정",
      path: "/communities/$postId/details/like",
    );
    return await http.execute();
  }

  ///게시글 좋아요 API
  Future<void> deleteHeart(int postId) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.patch,
      message: "게시글 하트 취소",
      path: "/communities/$postId/details/like/delete",
    );
    return await http.execute();
  }
}
