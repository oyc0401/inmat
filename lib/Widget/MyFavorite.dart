import 'package:flutter/material.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("내가 좋아하는 음식점"),
      ),
      body: Container(),
    );
  }
}
