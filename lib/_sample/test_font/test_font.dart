
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFont extends StatefulWidget {
  const TestFont({Key? key}) : super(key: key);

  @override
  State<TestFont> createState() => _TestFontState();
}

class _TestFontState extends State<TestFont> {
  double height = 10;
  double font = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: height + 10,
            color: Colors.red,
            child: Column(
              children: [
                Text(
                  "테스트",
                  style: TextStyle(fontSize: font,fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Text("높이: ${height}, 폰트: ${font}"),
        ],

      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                  child: Text("사각형 작게"),
                  onPressed: () {
                    height--;
                    setState(() {});
                  }),
              CupertinoButton(
                  child: Text("사각형 크게"),
                  onPressed: () {
                    height++;
                    setState(() {});
                  }),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CupertinoButton(
                  child: Text("폰트 작게"),
                  onPressed: () {
                    font--;
                    setState(() {});
                  }),
              CupertinoButton(
                  child: Text("폰트 크게"),
                  onPressed: () {
                    font++;
                    setState(() {});
                  }),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
