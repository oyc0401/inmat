import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';

import 'package:inmat/src/community/view/screens/post_view.dart';
import 'package:inmat/src/community/write/write_post.dart';
import 'package:inmat/utils/toast.dart';

import '../../../../inmat/inmat_api/inmat_api_library.dart';
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
    InmatApi.community.getPosts().onRefreshDenied(() {
      Message.showMessage("로그인이 만료되었습니다. 다시 로그인 해주세요");
    }).onError((error) {
      print(error);
      Message.showMessage("오류 :${error}");
    }).execute((list) {
      List<PostThumbModel> value = [];
      for (var map in list) {
        value.add(
          PostThumbModel.fromJson(map),
        );
      }
      _posts = value;
      success = true;
    });

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
