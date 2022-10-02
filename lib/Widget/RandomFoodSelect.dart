import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RandomFood.dart';

class RandomFoodSelect extends StatefulWidget {
  const RandomFoodSelect({Key? key}) : super(key: key);

  @override
  State<RandomFoodSelect> createState() => _RandomFoodSelectState();
}

class _RandomFoodSelectState extends State<RandomFoodSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("음식 랜덤 추천"),
      ),
      body: Column(
        children: [
          Text("밥"),
          Text("술"),
          Text("카페"),
          CupertinoButton(
              child: Text("회원가입 페이지 이동"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => const RandomFood(),
                  ),
                );
              })
        ],

      ),
    );
  }
}
