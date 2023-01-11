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
              ],
            ),
          );
        },
      ),
    );
  }

  Widget contentsSection(BuildContext context) {
    return Container(
      child: Provider.of<CommunityViewModel>(context).complete
          ? const View()
          : Container(),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PostData data = Provider.of<CommunityViewModel>(context).postData;
    return ContentWidget(
      onclick: (){},
      name: data.nickName,
      date: data.createdAt ?? "null",
      title: data.topic ?? "null",
      content: data.contents ?? "null",
      likeCount: data.countPostLike,
      commentCount: data.countComment,
    );
  }
}

