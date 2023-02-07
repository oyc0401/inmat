import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';
import 'package:inmat/src/community/view/domain/models/comment_model.dart';
import 'package:inmat/src/community/view/widgets/contents.dart';
import 'package:inmat/utils/toast.dart';
import 'package:provider/provider.dart';

import '../../main/providers/community_view_model.dart';
import '../domain/models/content_model.dart';
import '../providers/post_view_model.dart';
import '../widgets/Comment.dart';
import '../widgets/comment_text_form.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class PostView extends StatelessWidget {
  const PostView({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostViewModel(id),
      child: Consumer<PostViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Post id : $id'),
              actions: [
                IconButton(
                  onPressed: () async {
                    /// ToDo 본인만 지우는 버튼이 보이게 변경해야함.
                    try {
                      await InmatApi.community.deletePost(id);
                      Provider.of<CommunityViewModel>(context, listen: false)
                          .init();
                      Navigator.pop(context);
                    } on AccessDenied {
                      print('접근 권한이 없습니다.');
                      Message.showMessage('접근 권한이 없습니다.');
                    } catch (e) {
                      print('PostView: $e');
                    }
                  },
                  icon: Icon(Icons.delete),
                )
              ],
            ),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        contentsSection(context),
                        commentSection(context),
                      ],
                    ),
                  ),
                  CommentForm(
                    onSubmitted: () {
                      // print(Provider.of<CommunityViewModel>(context, listen: false)
                      //     .writtenComment);
                      Provider.of<PostViewModel>(context, listen: false)
                          .writeComment();
                    },
                    onChanged: (text) {
                      Provider.of<PostViewModel>(context, listen: false)
                          .setText(text);
                    },
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget contentsSection(BuildContext context) {
    ContentModel data = Provider.of<PostViewModel>(context).content;

    Widget wid = ContentWidget(
      onclick: () {
        Provider.of<PostViewModel>(context, listen: false).clickHeart();
      },
      name: data.nickName,
      date: data.createdAt,
      title: data.topic,
      content: data.contents,
      likeCount: Provider.of<PostViewModel>(context).heartCount,
      commentCount: Provider.of<PostViewModel>(context).commentCount,
      isHeart: Provider.of<PostViewModel>(context).isHeart,
    );
    return Provider.of<PostViewModel>(context).complete ? wid : Container();
  }

  Widget commentSection(BuildContext context) {
    List<Widget> list = [
      for (CommentModel comment in Provider.of<PostViewModel>(context).comments)
        Comment(
          nickName: comment.nickName,
          content: comment.contents,
          date: comment.createdAt,
          profileImgUrl: comment.profileImgUrl,
          isDadatgle: comment.parentId!=0,
        ),
    ];

    return Provider.of<PostViewModel>(context).complete
        ? Column(children: list)
        : Container();
  }
}
