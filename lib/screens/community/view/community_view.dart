import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/community/get_community_once.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  Map data = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  init() async {
    InMatGetCommunityOnce inMatGetCommunityOnce = InMatGetCommunityOnce();
    Map map = await inMatGetCommunityOnce.getPost(widget.id);
    print(map);
    data = map;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(' Post id : ${widget.id}')),
      body: ListView(children: [
        Container(
          child: Text("$data"),
        ),
      ]),
    );
  }
}
