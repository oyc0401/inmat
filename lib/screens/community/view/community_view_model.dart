import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/community/get_community_once.dart';
import 'package:inmat/inmat/inmat_api/community/write_comment.dart';

class CommunityViewModel with ChangeNotifier {
  CommunityViewModel(this.id) {
    init();
  }

  final int id;
  bool complete = false;

  Map data = {};
  late PostData postData;

  List comments=[];

  /// 댓글 적기
  String writtenComment="";
  void writeComment(){
    InMatWriteComment inMatWriteComment=InMatWriteComment();
    inMatWriteComment.sendComment(id, writtenComment);

  }
  init() async {
    InMatGetCommunityOnce inMatGetCommunityOnce = InMatGetCommunityOnce();
    Map map = await inMatGetCommunityOnce.getPost(id);
    print(map);
    postData=PostData(map);
    complete = true;
    notifyListeners();
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
