import 'package:flutter/cupertino.dart';


import 'package:inmat/src/community/view/screens/post_view.dart';
import 'package:inmat/src/community/write/write_post.dart';

import '../../models/post_thumb_data.dart';
import '../service/post_api.dart';

class CommunityViewModel with ChangeNotifier {
  CommunityViewModel() {
    init();
  }

  late List<PostThumbModel> _posts;
  bool success = false;

  List<PostThumbModel> get posts => _posts;

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
      CupertinoPageRoute(builder: (context) => PostView(id: id)),
    );
  }
}
