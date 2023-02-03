import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import '../../models/post_thumb_data.dart';

class CommunityModel {


  static Future<List<PostThumbModel>> getPosts() async {
    List<PostThumbModel> posts = [];
    List<Map> list = await InMatApi.community.getPosts();
    for (var map in list) {
      posts.add(
        PostThumbModel(
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
