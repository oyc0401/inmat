import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';

import 'package:inmat/src/community/screens/post_view.dart';
import 'package:inmat/src/community/screens/write_post.dart';
import 'package:inmat/utils/on_resign_in.dart';
import 'package:inmat/utils/toast.dart';

import '../../../inmat/inmat_api/inmat_api_library.dart';
import '../models/post_thumb_data.dart';


class CommunityViewModel with ChangeNotifier {
  CommunityViewModel() {
    init();
  }

  late List<PostThumbModel> _posts;
  bool success = false;

  List<PostThumbModel> get posts => _posts;

  init() async {
   await InmatApi.community.getPosts()
        .execute((list) {
      List<PostThumbModel> value = [];
      for (var map in list) {
        value.add(
          PostThumbModel.fromJson(map),
        );
      }
      _posts = value;
      success = true;

      notifyListeners();
    });


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
