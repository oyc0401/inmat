import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';

import 'package:inmat/src/community/screens/view.dart';
import 'package:inmat/src/community/screens/write.dart';
import 'package:inmat/utils/on_resign_in.dart';
import 'package:inmat/utils/toast.dart';

import '../../../inmat/inmat_api/inmat_api_library.dart';
import '../models/community_model.dart';


class CommunityViewModel with ChangeNotifier {
  CommunityViewModel() {
    init();
  }

  late List<CommunityModel> _posts;
  bool success = false;

  List<CommunityModel> get posts => _posts;

  init() async {
   await InmatApi.community.getPosts()
        .execute((list) {
      List<CommunityModel> value = [];
      for (var map in list) {
        value.add(
          CommunityModel.fromJson(map),
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
