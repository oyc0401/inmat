import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/community/get_community_once.dart';

class CommunityViewModel with ChangeNotifier {
  CommunityViewModel(this.id) {
    init();
  }

  final int id;
  bool complete = false;

  Map data = {};

  init() async {
    InMatGetCommunityOnce inMatGetCommunityOnce = InMatGetCommunityOnce();
    Map map = await inMatGetCommunityOnce.getPost(id);
    print(map);
    data = map;
    complete = true;
    notifyListeners();
  }
}
