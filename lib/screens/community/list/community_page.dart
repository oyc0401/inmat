import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/community/get_community.dart';
import 'package:inmat/screens/community/list/community_model.dart';
import 'package:provider/provider.dart';

import '../view/community_view.dart';

class Community extends StatelessWidget {
  const Community({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          postsSection(context),
        ],
      ),
    );
  }

  Widget postsSection(BuildContext context) {
    // List<Widget> posts = [];
    //
    // for (var data in Provider.of<CommunityModel>(context).posts) {
    //   posts.add(
    //     Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: PostWidget(data: data),
    //     ),
    //   );
    // }

    return Column(
      children: [
        for (var data in Provider.of<CommunityModel>(context).posts)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PostWidget(data: data),
          )
      ],
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({Key? key, required this.data}) : super(key: key);
  final PostData data;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => CommunityView(id: data.postId)),
        );
      },

      leading: Text("${data.postId}"),
      title: Text("${data.topic}"),
      subtitle: Text("${data.contents}"),
      trailing: Text("${data.nickName}"),
    );
  }
}
