import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/community/get_community.dart';

import 'read_page.dart';

class Community extends StatefulWidget {
  const Community({Key? key}) : super(key: key);

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  List list = [];

  init() async {
    InMatGetCommunity inMatGetCommunity = InMatGetCommunity();
    list = await inMatGetCommunity.getHome();
    print(list);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          for (var map in list) PostWidget(map: map),
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.map}) : super(key: key);
  final Map map;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(builder: (context) => ReadPage(id: map['postId'])),
        );
      },
      child: Text(map.toString()),
    );
  }
}
