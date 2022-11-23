import 'package:flutter/material.dart';
import 'Comment.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Post id : 1')),
      body: ListView(children: [
        Column(
          children: [
            Container(
              color: Colors.green,
            ),
            Comment(),
          ],
        ),
      ]),
    );
  }
}
