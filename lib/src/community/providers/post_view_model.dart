import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/auth/user.dart';
import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';
import 'package:inmat/utils/on_resign_in.dart';
import 'package:inmat/utils/toast.dart';

import '../models/comment_model.dart';
import '../models/content_model.dart';
import '../view/domain/service/post_model.dart';

class PostViewModel with ChangeNotifier {
  PostViewModel(this._id, BuildContext context) {
    init(context);
  }

  final int _id;
  bool complete = false;

  late bool isHeart;
  late int commentCount;
  late int heartCount;

  String _writtenComment = "";

  late ContentModel _content;

  ContentModel get content => _content;

  List<CommentModel> _comments = [];

  List<CommentModel> get comments => _comments;

  void writeComment(BuildContext context) {
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

    InmatApi.community.writeComment(_id, _writtenComment).onDataBaseFailed(() {
      Message.showMessage('게시물이 삭제 되었습니다.');
      print("없는 게시물 입니다.");
    }).execute((value) {
      _writtenComment = '';
    });
  }

  void clickHeart(BuildContext context) {
    if (isHeart) {
      isHeart = false;
      heartCount--;
      InmatApi.community.deleteHeart(_id).execute((value) => null);
    } else {
      isHeart = true;
      heartCount++;
      InmatApi.community.setHeart(_id).execute((value) => null);
    }
    notifyListeners();
  }

  void setText(String comment) => _writtenComment = comment;

  init(BuildContext context) async {
    await InmatApi.community.getPost(_id).execute((json) {
      _content = ContentModel.fromJson(json);
      print('ContentModel.fromJson(json)');

      _comments = parseComment(content.commentInfoDtoList);

      isHeart = _content.myLike;
      commentCount = _content.countPostLike;
      heartCount = _content.countPostLike;
      complete = true;

      notifyListeners();
    });
  }


  List<CommentModel> parseComment(List commentsMap) {
    List lili=[];

    // print(commentsMap[0]);

    for(List listMap in commentsMap){
      for(Map<String, dynamic> map in listMap){
        lili.add(map);
      }
    }
    // print('a');

    //
    // List<Map<String, dynamic>> maps = commentsMap.cast<Map<String, dynamic>>();


    // print(maps);
    // maps.map((data) {
    //   print(data);
    // }).toList();

    List<CommentModel> comments =
    lili.map((data) => CommentModel.fromJson(data)).toList();
    print('CommentModel.fromJson(data)).toList()');
    return comments;
  }
}
