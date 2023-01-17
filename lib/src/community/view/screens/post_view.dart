import 'package:flutter/material.dart';
import 'package:inmat/src/community/view/domain/models/comment_model.dart';
import 'package:inmat/src/community/view/widgets/contents.dart';
import 'package:provider/provider.dart';

import '../domain/models/content_model.dart';
import '../providers/post_view_model.dart';
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
            appBar: AppBar(title: Text('Post id : $id')),
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
    return Provider.of<PostViewModel>(context).complete
        ? const ContentsView()
        : Container();
  }

  Widget commentSection(BuildContext context) {
    return Provider.of<PostViewModel>(context).complete
        ? const CommentView()
        : Container();
  }
}

class ContentsView extends StatelessWidget {
  const ContentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ContentModel data = Provider.of<PostViewModel>(context).content;
    return ContentWidget(
      onclick: () {},
      name: data.nickName,
      date: data.createdAt,
      title: data.topic,
      content: data.contents,
      likeCount: data.countPostLike,
      commentCount: data.countComment,
    );
  }
}

class CommentView extends StatelessWidget {
  const CommentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CommentModel comment
            in Provider.of<PostViewModel>(context).comments)
          ListTile(
            leading:  Text('${comment.commentId}'),
            title: Text(comment.contents),
            trailing: Text(comment.nickName),
            subtitle: Text(comment.createdAt),
          ),
      ],
    );
  }
}
