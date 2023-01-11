import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/inmat/inmat_api/inmat_exception.dart';

class CommunityViewModel with ChangeNotifier {
  CommunityViewModel(this.id) {
    init();
  }

  final int id;
  bool complete = false;

  Map data = {};
  late PostData postData;

  List comments = [];

  /// 댓글 적기
  String writtenComment = "";

  void writeComment() {
    InMatApi.community.writeComment(id, writtenComment);
  }

  init() async {
    try{
      Map map = await InMatApi.community.getPost(id);
      print(map);
      postData = PostData(map);
      complete = true;
      notifyListeners();
    }on DataBaseFailed{
      print("없는 게시물 입니다.");
    }catch(e){
      print(e);
    }


  }
}

class PostData {
  PostData(this._post);

  final Map _post;

  String get userId => _post['userId'];

  int get postId => _post['postId'];

  String? get profileImgUrl => _post['profileImgUrl'];

  String get nickName => _post['nickName'];

  String get topic => _post['topic']; //not null

  String get contents => _post['contents']; //not null

  int get countPostLike => _post['countPostLike'];

  int get countComment => _post['countComment'];

  String get createdAt => _post['crated_at']; //not null

  String? get imgUrl => _post['imgUrl'];

  bool get myLike => _post['myLike'];

  @override
  String toString() {
    return "postId: $postId, nickName: $nickName";
  }
}
