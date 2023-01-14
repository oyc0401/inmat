import 'package:flutter/material.dart';

class LikeIcon extends StatelessWidget {
  const LikeIcon({
    Key? key,
    required this.count,
  }) : super(key: key);
  final int count;

  final Color likeColor = const Color(0xffff5454);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.thumb_up_alt_outlined,
          size: 15,
          color: likeColor,
        ),
        const SizedBox(width: 2),
        Text(
          "$count",
          style: TextStyle(
            color: likeColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class CommentIcon extends StatelessWidget {
  const CommentIcon({
    Key? key,
    required this.count,
  }) : super(key: key);
  final int count;

  final Color commentColor = const Color(0xff82b0d7);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(
          Icons.comment,
          size: 15,
          color: commentColor,
        ),
        const SizedBox(width: 2),
        Text(
          "$count",
          style:  TextStyle(
            color: commentColor,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
