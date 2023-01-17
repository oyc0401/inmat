import 'package:flutter/cupertino.dart';
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
  String _writtenComment = "";

  bool complete = false;

  ContentModel get content => _postModel.post;

  List<CommentModel> get comments => _postModel.comments;

  void writeComment() {
    try {
      InMatApi.community.writeComment(_id, _writtenComment);
    } on DataBaseFailed {
      Message.showMessage('게시물이 삭제 되었습니다.');
      print("없는 게시물 입니다.");
    } catch (e) {
      print('PostViewModel: $e');
    }
  }

  void setText(String comment) {
    _writtenComment = comment;
  }

  init() async {
    try {
      _postModel = await PostModel.getPost(_id);
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
