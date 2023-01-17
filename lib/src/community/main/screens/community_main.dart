import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:inmat/widgets/ink_button.dart';

import '../providers/community_view_model.dart';
import '../widgets/post_thumb.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("자유 게시판"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<CommunityViewModel>(context,listen: false).init();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: ListView(
        children: [
          Provider.of<CommunityViewModel>(context).success
              ? postsSection(context)
              : Container(),
        ],
      ),
      floatingActionButton: WriteButton(
        onclick: () {
          Provider.of<CommunityViewModel>(context, listen: false)
              .pushWrite(context);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget postsSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          for (var data in Provider.of<CommunityViewModel>(context).posts)
            PostThumb(
              onclick: () {
                Provider.of<CommunityViewModel>(context, listen: false)
                    .pushView(context, id: data.postId);
              },
              title: data.topic,
              text: data.contents,
              date: data.createdAt,
              name: data.nickName,
              likeCount: data.countPostLike,
              commentCount: data.countComment,
            )
        ],
      ),
    );
  }
}

class WriteButton extends StatelessWidget {
  const WriteButton({Key? key, required this.onclick}) : super(key: key);

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return InkButtonMaterial(
      onclick: onclick,
      inkBorderRadius: const BorderRadius.all(
        Radius.circular(100),
      ),
      color: Colors.white,
      child: Container(
        width: 90,
        height: 48,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color(0xffe0e0e0),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.create,
              color: Color(0xffF25C05),
            ),
            SizedBox(width: 4),
            Text("작성"),
          ],
        ),
      ),
    );
  }
}