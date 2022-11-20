import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';

import '../../inmat/auth/inMatAuth.dart';
import '../NavigatePage.dart';
import 'RegisterEmail.dart';
import 'RegisterProfile.dart';

class SignInEmail extends StatefulWidget {
  const SignInEmail({Key? key}) : super(key: key);

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  String id = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("이메일 로그인"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text("아이디: "),
              Expanded(
                child: TextField(
                  onChanged: (text) {
                    id = text;
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text("비밀번호: "),
              Expanded(
                child: TextField(
                  onChanged: (text) {
                    password = text;
                  },
                ),
              ),
            ],
          ),
          CupertinoButton(
              child: Text("로그인"),
              onPressed: () async{
                print(id);
                print(password);

                try {
                  await InMatAuth.instance.signInEmail("test123", "qwe12345&&");
                } on SignInFailed {
                  // 로그인 실패 메세지 띄우기
                } catch (e) {
                  // 오류 메세지 띄우기
                  print(e);
                }
              }),
        ],
      ),
    );
  }
}
