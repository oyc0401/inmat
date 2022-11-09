import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
