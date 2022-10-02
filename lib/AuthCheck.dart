import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Widget/NavigatePage.dart';

import 'Widget/SignIn.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원 체크"),
      ),
      body: Column(
        children: [
          CupertinoButton(
              child: Text("메인 페이지 이동"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const NavigatePage(),
                    ),
                    (route) => false);
              }),
          CupertinoButton(
              child: Text("로그인 페이지 이동"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const SignIn(),
                    ),
                    (route) => false);
              }),
        ],
      ),
    );
  }
}
