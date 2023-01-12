import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/widgets/shelf.dart';

class MyPost extends StatefulWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  State<MyPost> createState() => _MyPostState();
}

class _MyPostState extends State<MyPost> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    posts = await InMatApi.account.getPosts();
    complete = true;
    setState(() {});
  }

  bool complete = false;
  List<Map> posts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내가 쓴 게시글"),
      ),
      body: Column(
        children: [
          complete ? section() : Container(),
        ],
      ),
    );
  }

  Widget section() {
    return posts.isEmpty
        ? Text("쓴 게시글이 아직 없습니다.")
        : Shelf(
            children: [
              for (Map map in posts) Text("$map"),
            ],
          );
  }
}
