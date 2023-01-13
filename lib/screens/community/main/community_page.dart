import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/screens/community/main/community_model.dart';
import 'package:inmat/widgets/ink_button.dart';
import 'package:provider/provider.dart';

import '../view/community_view.dart';
import 'package:inmat/widgets/community/post_thumb.dart';

import '../write/write_post.dart';

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
      floatingActionButton: WriteButton(
        onclick: () {
          Navigator.push(
              context, CupertinoPageRoute(builder: (context) => WritePost()));
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
          for (var data in Provider.of<CommunityModel>(context).posts)
            PostThumb(
              onclick: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) => CommunityView(id: data.postId)),
                );
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
    return InkButton(
        onclick: onclick,
        inkBorderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
        color: Colors.white,
        child: Container(
          width: 90 ,
          height: 48 ,
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
        ));

  }
}
