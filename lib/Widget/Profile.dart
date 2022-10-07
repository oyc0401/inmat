import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("마이페이지"),
        actions: <Widget>[
          IconButton(
        icon: Icon(Icons.settings), // 장바구니 아이콘 생성
         onPressed: () {
       },)
    ],
      ),
      body: Container(),
    );
  }
}
