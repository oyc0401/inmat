import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/auth_check.dart';

import 'package:inmat/inmat/auth/inmat_auth.dart';

void main() async {
  //////
  // DB에서 유저 정보 가져오기
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await InMatAuth.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      ),
      theme: ThemeData(
        fontFamily: 'Binggrae2',
        useMaterial3: true,
      ),
      home:  const AuthCheck(), //TestFont(),
    );
  }
}

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
