import 'package:flutter/cupertino.dart';

import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/src/community/view/community_view.dart';
import 'package:inmat/src/community/write/write_post.dart';

import '../model/post_thumb_data.dart';

class CommunityModel with ChangeNotifier {
  CommunityModel() {
    init();
  }

  bool success = false;
  final List<PostThumbData> _posts = [];

  List<PostThumbData> get posts => _posts;

  init() async {
    List<Map> list = await InMatApi.community.getPosts();
    for (var map in list) {
      _posts.add(
        PostThumbData(
          postId: map['postId'],
          nickName: map['nickName'],
          topic: map['topic'],
          contents: map['contents'],
          countPostLike: map['countPostLike'],
          countComment: map['countComment'],
          createdAt: map['created_at'],
          imgUrl: map['imgUrl'],
        ),
      );
    }
    success = true;
    notifyListeners();
  }

  void pushWrite(BuildContext context) {
    Navigator.push(
        context, CupertinoPageRoute(builder: (context) => WritePost()));
  }

  void pushView(BuildContext context, {required int id}) {
    Navigator.push(
      context,
      CupertinoPageRoute(builder: (context) => CommunityView(id: id)),
    );
  }
}
