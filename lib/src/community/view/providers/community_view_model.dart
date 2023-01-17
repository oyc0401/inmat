import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/inmat/inmat_api/inmat_exception.dart';

import '../models/post_model.dart';

class CommunityViewModel with ChangeNotifier {
  CommunityViewModel(this.id) {
    init();
  }

  final int id;
  bool complete = false;

  Map data = {};
  late PostModel postModel;

  List comments = [];

  /// 댓글 적기
  String writtenComment = "";

  void writeComment() {
    InMatApi.community.writeComment(id, writtenComment);
  }

  init() async {
    try {
      Map<String,dynamic> map = await InMatApi.community.getPost(id);
      // print(map);
      postModel = PostModel.fromJson(map);
      complete = true;
      notifyListeners();
    } on DataBaseFailed {
      print("없는 게시물 입니다.");
    } catch (e) {
      print(e);
    }
  }
}