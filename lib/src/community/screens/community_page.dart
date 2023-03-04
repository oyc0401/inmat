import 'package:flutter/material.dart';
import 'package:inmat/utils/inmat_colors.dart';

import 'package:provider/provider.dart';

import 'package:inmat/widgets/ink_button.dart';

import '../../../widgets/shelf.dart';
import '../providers/community_view_model.dart';

import '../widgets/count_icon.dart';

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "커뮤니티",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<CommunityViewModel>(context, listen: false).init();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Provider.of<CommunityViewModel>(context).success
          ? postsSection(context)
          : Container(),
    );
  }

  Widget postsSection(BuildContext context) {
    return ListView(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: WriteButton(
            onclick: () {
              Provider.of<CommunityViewModel>(context, listen: false)
                  .pushWrite(context);
            },
          ),
        ),
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
          ),
      ],
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
        Radius.circular(13),
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

/// 커뮤니티 화면 메인에 나오는 게시물 위젯
class PostThumb extends StatelessWidget {
  /// 에브리타임 자유게시판 ui를 가지고있다.
  const PostThumb({
    Key? key,
    required this.onclick,
    required this.title,
    required this.text,
    required this.date,
    required this.name,
    required this.likeCount,
    required this.commentCount,
  }) : super(key: key);

  final VoidCallback onclick;

  final String title;
  final String text;
  final String date;
  final String name;
  final int likeCount;
  final int commentCount;

  @override
  Widget build(BuildContext context) {
    return InkButtonMaterial(
      onclick: onclick,
      color: Colors.white,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: Color(0xffa1a1a1),
            ),
          ),
        ),
        child: Shelf(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          space: 2,
          children: [
            titleSection(),
            contextSection(),
            likeSection(),
          ],
        ),
      ),
    );
  }

  Widget titleSection() {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
    );
  }

  Widget contextSection() {
    return Text(
      text,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Color(0xff565656),
        fontSize: 12,
      ),
    );
  }

  Widget likeSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          name,
          style: const TextStyle(
            color: Color(0xff888888),
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          date,
          style: const TextStyle(
            color: Color(0xff888888),
            fontSize: 12,
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
          child: LikeIcon(
            count: likeCount,
          ),
        ),
        CommentIcon(
          count: commentCount,
        ),
      ],
    );
  }
}
