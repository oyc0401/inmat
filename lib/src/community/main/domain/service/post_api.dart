import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import '../model/post_thumb_data.dart';

class CommunityModel {


  static Future<List<PostThumbData>> getPosts() async {
    List<PostThumbData> posts = [];
    List<Map> list = await InMatApi.community.getPosts();
    for (var map in list) {
      posts.add(
        PostThumbData(
          postId: map['postId'],
          nickName: map['nickName'],
          topic: map['topic'],
          contents: map['contents'],
          countPostLike: map['countPostLike'],
          countComment: map['countComment'],
          createdAt: map['createdAt'],
          imgUrl: map['imgUrl'],
        ),
      );
    }
    return posts;
  }


}
