import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/src/community/view/domain/models/comment_model.dart';

import '../models/content_model.dart';

class PostModel {
  PostModel._(this.post, this.comments);

  final ContentModel post;
  final List<CommentModel> comments;

  static Future<PostModel> getPost(int id) async {
    Map<String, dynamic> json = await InmatApi.community.getPost(id);

    ContentModel contentModel = ContentModel.fromJson(json);
    print('ContentModel.fromJson(json)');

    List<CommentModel> comments = _parseComment(
        contentModel.commentInfoDtoList);

    return PostModel._(contentModel, comments);
  }

  static List<CommentModel> _parseComment(List commentsMap) {
    List lili=[];

    // print(commentsMap[0]);

    for(List listMap in commentsMap){
      for(Map<String, dynamic> map in listMap){
        lili.add(map);
      }
    }
    // print('a');

    //
    // List<Map<String, dynamic>> maps = commentsMap.cast<Map<String, dynamic>>();


    // print(maps);
    // maps.map((data) {
    //   print(data);
    // }).toList();

    List<CommentModel> comments =
    lili.map((data) => CommentModel.fromJson(data)).toList();
    print('CommentModel.fromJson(data)).toList()');
    return comments;
  }
}
