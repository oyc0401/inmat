import 'package:flutter/material.dart';

class Comment extends StatefulWidget {
  const Comment({Key? key}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container( width: 200, height: 80, color: Colors.black,)
      ],
    );
  }
}
