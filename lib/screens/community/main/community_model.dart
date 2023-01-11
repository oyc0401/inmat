import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

class CommunityModel with ChangeNotifier {
  CommunityModel() {
    init();
  }

  bool success = false;
  final List<PostThumbData> _posts = [];

  List<PostThumbData> get posts => _posts;

  init() async {
    List<Map> maps = await InMatApi.community.getPosts();
    // print(maps);
    maps.forEach((map) => _posts.add(PostThumbData(map)));
    success = true;
    notifyListeners();
  }
}

class PostThumbData {
  PostThumbData(this._post);

  final Map _post;

  int get postId => _post['postId'];

  String get nickName => _post['nickName'];

  String get topic => _post['topic']; //not null

  String get contents => _post['contents']; //not null

  int get countPostLike => _post['countPostLike'];

  int get countComment => _post['countComment'];

  String get createdAt => _post['created_at']; //not null

  String? get imgUrl => _post['imgUrl'];

  @override
  String toString() {
    return "postId: $postId, nickName: $nickName";
  }
}
