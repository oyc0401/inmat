import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내가 쓴 게시글"),
      ),
      body: Container(),
    );
  }
}
