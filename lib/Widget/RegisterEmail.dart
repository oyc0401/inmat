import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Widget/RegisterProfile.dart';

import 'NavigatePage.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입: 이메일"),
      ),
      body: Column(children: [
        CupertinoButton(
            child: Text("회원정보 입력 이동"),
            onPressed: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const RegisterProfile(),
                ),
              );
            }),
      ]),
    );
  }
}
