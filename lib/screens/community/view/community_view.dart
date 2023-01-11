import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/community/get_community_once.dart';
import 'package:inmat/widgets/community/contents.dart';
import 'package:inmat/widgets/community/count_icon.dart';
import 'package:provider/provider.dart';

import 'community_view_model.dart';

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class CommunityView extends StatelessWidget {
  const CommunityView({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(id),
      child: Consumer<CommunityViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: Text('Post id : $id')),
            body: ListView(
              physics: ClampingScrollPhysics(),
              children: [
                contentsSection(context),
                commentSection(context),
              ],
            ),
            floatingActionButton: CommentForm(),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }

  Widget contentsSection(BuildContext context) {
    return Provider.of<CommunityViewModel>(context).complete
        ? const View()
        : Container();
  }

  Widget commentSection(BuildContext context) {
    return Column(
      children: [
        for (dynamic d in Provider.of<CommunityViewModel>(context).comments)
          Text(d.toString()),
      ],
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostData data = Provider.of<CommunityViewModel>(context).postData;
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

class CommentForm extends StatelessWidget {
  const CommentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      color: Color(0xffcecece),
      child: Row(
        children: [
          Expanded(child: TextField(
            onChanged: (text) {
              Provider.of<CommunityViewModel>(context, listen: false)
                  .writtenComment = text;
            },
          )),
          IconButton(
              onPressed: () {
                print(Provider.of<CommunityViewModel>(context, listen: false)
                    .writtenComment);
                Provider.of<CommunityViewModel>(context, listen: false).writeComment();

              },
              icon: Icon(Icons.send)),
        ],
      ),
    );
  }
}
