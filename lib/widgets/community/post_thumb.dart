import 'package:flutter/material.dart';
import 'package:inmat/widgets/community/count_icon.dart';
import 'package:inmat/widgets/shelf.dart';

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
    return Shelf(
      onclick: onclick,
      border: const Border(
        bottom: BorderSide(
          width: 0.5,
          color: Color(0xffa1a1a1),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      color: Colors.white,
      space: 2,
      children: [
        titleSection(),
        contextSection(),
        likeSection(),
      ],
    );
  }

  Widget titleSection() {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
    );
  }

  Widget contextSection() {
    return Text(
      text,
      maxLines: 5,
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
          date,
          style: const TextStyle(
            color: Color(0xff888888),
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          name,
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
