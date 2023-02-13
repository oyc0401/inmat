part of '../inmat_api_library.dart';

class InmatCommunityApi {
  ///커뮤니티 조회 API
  InmatCatchException<List<Map<String, dynamic>>> getPosts() {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "커뮤니티 불러오기",
      path: "/communities",
    );

    return InmatCatchException.basic(() async {
      return await (await http.execute()).cast<Map<String, dynamic>>();
    });
  }

  ///특정 게시물 조회 API
  InmatCatchException<Map<String, dynamic>> getPost(int id) {
    InmatTokenHttp http = InmatTokenHttp(
      Http.get,
      message: "게시물 불러오기",
      path: "/communities/$id",
    );
    return InmatCatchException.basic(() async {
      return await http.execute();
    });
  }

  ///게시글 작성 API
  InmatCatchException<void> writePost(
      {required String title, required String content}) {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "게시글 작성",
      path: "/communities",
      body: {
        "contents": content,
        "topic": title,
      },
    );

    return InmatCatchException.basic(() async {
      return await http.execute();
    });
  }

  ///게시글 삭제 API
  InmatCatchException<void> deletePost(int postId) {
    InmatTokenHttp http = InmatTokenHttp(
      Http.patch,
      message: "게시글 삭제",
      path: "/communities/$postId/delete",
    );
    return InmatCatchException.basic(() async {
      return await http.execute();
    });
  }

  ///댓글 작성 API
  InmatCatchException<void> writeComment(int id, String comment) {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "댓글 쓰기",
      path: "/communities/$id/details/comment",
      body: {
        "contents": comment,
      },
    );

    /// ToDo 댓글쓰고 리턴값 받아야함
    return InmatCatchException.basic(() async {
      var v = await http.execute();
      print(v);
      return;
    });
  }

  ///게시글 좋아요 API
  InmatCatchException<void> setHeart(int postId) {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "게시글 하트 설정",
      path: "/communities/$postId/details/like",
    );
    return InmatCatchException.basic(() async {
      return await http.execute();
    });
  }

  ///게시글 좋아요 API
  InmatCatchException<void> deleteHeart(int postId) {
    InmatTokenHttp http = InmatTokenHttp(
      Http.patch,
      message: "게시글 하트 취소",
      path: "/communities/$postId/details/like/delete",
    );

    return InmatCatchException.basic(() async {
      return await http.execute();
    });
  }
}
