import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  const PostCard({
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
    return Column(
      children: [
        InkWell(
          onTap: onclick,
          child: Ink(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleSection(),
                contextSection(),
                likeSection(),
              ],
            ),
          ),
        ),
        Container(
          height: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }

  Text titleSection() {
    return Text(
      title,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black),
    );
  }

  Text contextSection() {
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
    const Color commentColor = Color(0xff82b0d7);
    const Color likeColor = Color(0xffff5454);

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
          child: Row(
            children: [
              const Icon(
                Icons.thumb_up_alt_outlined,
                size: 15,
                color: likeColor,
              ),
              const SizedBox(width: 2),
              Text(
                "$likeCount",
                style: const TextStyle(
                  color: likeColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Icon(
              Icons.comment,
              size: 15,
              color: commentColor,
            ),
            const SizedBox(width: 2),
            Text(
              "$commentCount",
              style: const TextStyle(
                color: commentColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
