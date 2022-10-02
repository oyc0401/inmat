import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavigatePage.dart';

class RegisterProfile extends StatefulWidget {
  const RegisterProfile({Key? key}) : super(key: key);

  @override
  State<RegisterProfile> createState() => _RegisterProfileState();
}

class _RegisterProfileState extends State<RegisterProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원정보 입력"),
      ),
      body: Column(children: [
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
      ]),
    );
  }
}
