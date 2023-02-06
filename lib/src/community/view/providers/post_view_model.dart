import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/auth/user_model.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/inmat/inmat_api/inmat_exception.dart';
import 'package:inmat/utils/toast.dart';

import '../domain/models/comment_model.dart';
import '../domain/models/content_model.dart';
import '../domain/service/post_model.dart';

class PostViewModel with ChangeNotifier {
  PostViewModel(this._id) {
    init();
  }

  final int _id;
  late PostModel _postModel;
  bool complete = false;

  late bool isHeart;
  late int commentCount;
  late int heartCount;

  String _writtenComment = "";

  ContentModel get content => _postModel.post;

  List<CommentModel> get comments => _postModel.comments;

  void writeComment() {


    User user = InmatAuth.instance.currentUser!;
    comments.add(CommentModel(
        commentId: 00,
        nickName: user.nickName,
        profileImgUrl: user.profileImgUrl,
        contents: _writtenComment,
        countCommentLike: 0,
        createdAt: '방금',
        groupNumber: 0,
        parentId: 0,
        checkUpdated: false,
        myLike: false));
    notifyListeners();

    try {
      InMatApi.community.writeComment(_id, _writtenComment);
      _writtenComment='';
    } on DataBaseFailed {
      Message.showMessage('게시물이 삭제 되었습니다.');
      print("없는 게시물 입니다.");
    } catch (e) {
      print('PostViewModel: $e');
    }

    // _postModel.comments.add(CommentModel(commentId: commentId, nickName: nickName, profileImgUrl: profileImgUrl, contents: contents, countCommentLike: countCommentLike, createdAt: createdAt, groupNumber: groupNumber, parentId: parentId, checkUpdated: checkUpdated, myLike: myLike));
  }

  clickHeart() {
    if (isHeart) {
      isHeart = false;
      heartCount--;
      InMatApi.community.deleteHeart(_id);
    } else {
      isHeart = true;
      heartCount++;
      InMatApi.community.setHeart(_id);
    }
    notifyListeners();
  }

  void setText(String comment) => _writtenComment = comment;

  init() async {
    try {
      _postModel = await PostModel.getPost(_id);
      isHeart = _postModel.post.myLike;
      commentCount = _postModel.post.countPostLike;
      heartCount = _postModel.post.countPostLike;
      complete = true;
      notifyListeners();
    } on DataBaseFailed {
      Message.showMessage('게시물이 삭제 되었습니다.');
      print("없는 게시물 입니다.");
    } catch (e) {
      print(e);
    }
  }
}
