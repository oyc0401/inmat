import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../NavigatePage.dart';
import 'RegisterEmail.dart';
import 'RegisterProfile.dart';
import 'SignInEmail.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("로그인"),
      ),
      body: Column(children: [
        Expanded(child: Container()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              child: Text("이메일 로그인"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const SignInEmail()),
                );
              },
            ),
            CupertinoButton(
              child: Text("회원가입"),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => const Register()),
                );
              },
            ),
          ],
        ),
        // CupertinoButton(
        //     child: Text("회원정보 입력 이동"),
        //     onPressed: () {
        //       Navigator.pushAndRemoveUntil(
        //           context,
        //           CupertinoPageRoute(
        //             builder: (context) => const RegisterProfile(),
        //           ),
        //           (route) => false);
        //     }),

        SizedBox(
          height: 100,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: CupertinoButton(
              child: Text("메인 페이지 이동"),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => const NavigatePage(),
                    ),
                    (route) => false);
              }),
        ),
      ]),
    );
  }
}
