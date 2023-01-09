import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/community/get_community_once.dart';
import 'package:provider/provider.dart';

import 'community_view_model.dart';

class CommunityView extends StatelessWidget {
  const CommunityView({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CommunityViewModel(id),
      child: Scaffold(
        appBar: AppBar(title: Text('Post id : $id')),
        body: ListView(children: [
          Container(
            child: View(),
          ),
        ]),
      ),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Text("${Provider.of<CommunityViewModel>(context).data}");
  }



}

