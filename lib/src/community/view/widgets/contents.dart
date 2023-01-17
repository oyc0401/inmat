import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/widgets/shelf.dart';

import '../../widgets/count_icon.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({
    Key? key,
    required this.onclick,
    required this.name,
    required this.date,
    required this.title,
    required this.content,
    required this.likeCount,
    required this.commentCount,
    this.profileImage,
    required this.isHeart,
  }) : super(key: key);

  final VoidCallback onclick;

  final String name;
  final String date;
  final String title;
  final String content;
  final int likeCount;
  final int commentCount;
  final String? profileImage;
  final bool isHeart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Shelf(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          space: 5,
          children: [
            ContentsTile(
              leading: Container(
                decoration: BoxDecoration(
                  color: Color(0xffd9d9d9),
                  borderRadius: BorderRadius.circular(5.0),
                ),
                width: 40,
                height: 40,
                child: Center(child: Text(profileImage ?? "null")),
              ),
              title: Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(content),
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
                  child: LikeIcon(
                    count: likeCount,
                  ),
                ),
                CommentIcon(
                  count: commentCount,
                ),
              ],
            ),
            CupertinoButton(
                color: isHeart ? Color(0xffffb0b0) : Color(0xffd9d9d9),
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                minSize: 0,
                onPressed: onclick,
                child: Text(
                  isHeart ? "공감 취소" : "공감",
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                )),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class ContentsTile extends StatelessWidget {
  const ContentsTile({
    Key? key,
    required this.leading,
    required this.title,
    required this.subtitle,
    this.space = 8,
  }) : super(key: key);

  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final double space;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
          leading,
          SizedBox(width: space),
          Container(
            // color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                title,
                subtitle,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
