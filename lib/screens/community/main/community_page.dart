import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/screens/community/main/community_model.dart';
import 'package:provider/provider.dart';

import '../view/community_view.dart';
import 'package:inmat/widgets/community/post_thumb.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(

        children: [
          postsSection(context),
        ],
      ),
    );
  }

  Widget postsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          for (var data in Provider.of<CommunityModel>(context).posts)
            PostThumb(
              onclick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => CommunityView(id: data.postId)),
                );
              },
              title: data.topic ?? "null",
              text: data.contents ?? "null",
              date: data.createdAt ?? "null",
              name: data.nickName,
              likeCount: data.countPostLike,
              commentCount: data.countComment,

            )
        ],
      ),
    );
  }
}
