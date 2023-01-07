import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/community/get_community.dart';

class CommunityModel with ChangeNotifier {
  CommunityModel() {
    init();
  }

  bool success = false;
  final List<PostData> _posts = [];

  List<PostData> get posts => _posts;

  init() async {
    InMatGetCommunity inMatGetCommunity = InMatGetCommunity();
    List<Map> maps = await inMatGetCommunity.getHome();
    maps.forEach((map) => _posts.add(PostData(map)));
    success = true;
    notifyListeners();
  }
}

class PostData {
  PostData(this._post);

  final Map _post;

  int get postId => _post['postId'];

  String get nickName => _post['nickName'];

  String? get topic => _post['topic']; //not null

  String? get contents => _post['contents']; //not null

  int get countPostLike => _post['countPostLike'];

  int get countComment => _post['countComment'];

  String? get cratedAt => _post['created_at']; //not null

  String? get imgUrl => _post['imgUrl'];

  @override
  String toString() {
    return "postId: $postId, nickName: $nickName";
  }
}
