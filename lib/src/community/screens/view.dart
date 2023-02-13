import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat.dart';
import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';
import 'package:inmat/inmat/models/token_model.dart';
import 'package:inmat/src/community/models/comment_model.dart';

import 'package:inmat/utils/on_resign_in.dart';
import 'package:inmat/utils/toast.dart';
import 'package:provider/provider.dart';

import '../providers/community_view_model.dart';
import '../models/content_model.dart';
import '../providers/post_view_model.dart';
import '../widgets/view.comment.dart';
import '../widgets/view.comment_text_form.dart';
import '../widgets/view.contents.dart';

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
      create: (context) => PostViewModel(id, context),
      child: Consumer<PostViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Post id : $id'),
              actions: [
                IconButton(
                  onPressed: () {
                    /// ToDo 본인만 지우는 버튼이 보이게 변경해야함.
                    ///
                    InmatApi.community.deletePost(id).execute((value) {
                      Provider.of<CommunityViewModel>(context, listen: false)
                          .init();
                      Navigator.pop(context);
                    });
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
                          .writeComment(context);
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
    if (!Provider.of<PostViewModel>(context).complete) {
      return Container();
    }
    ContentModel data = Provider.of<PostViewModel>(context).content;

    Widget wid = ContentWidget(
      onclick: () {
        Provider.of<PostViewModel>(context, listen: false).clickHeart(context);
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
          isDadatgle: comment.parentId != 0,
        ),
    ];

    return Provider.of<PostViewModel>(context).complete
        ? Column(children: list)
        : Container();
  }
}
