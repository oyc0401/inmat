import 'package:flutter/cupertino.dart';

import 'package:inmat/src/community/main/domain/service/post_api.dart';
import 'package:inmat/src/community/view/screens/community_view.dart';
import 'package:inmat/src/community/write/write_post.dart';

import '../domain/model/post_thumb_data.dart';

class CommunityViewModel with ChangeNotifier {
  CommunityViewModel() {
    init();
  }

  late List<PostThumbData> _posts;
  bool success = false;

  List<PostThumbData> get posts => _posts;

  init() async {
    _posts = await CommunityModel.getPosts();
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
