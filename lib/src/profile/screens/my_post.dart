import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';
import 'package:inmat/widgets/shelf.dart';

import '../../community/screens/view.dart';

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
    posts = await InmatApi.user.getPosts();
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
      body: ListView(
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
              for (Map map in posts)
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => PostView(id: map['postId'])));
                  },
                  title: Text(
                    "${map['topic']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "${map['contents']}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
            ],
          );
  }
}
