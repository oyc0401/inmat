import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Widget/NavigatePage.dart';
import 'package:restaurant/dartPage.dart';


import 'Widget/Account/ChooseSignIn.dart';
import 'inmat/user/inMatUser.dart';
import 'inmat/user/user_model.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    User? user = InMatUser.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("회원 체크"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("user information: $user"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                  color: Colors.grey,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton(
                  color: Colors.grey,
                  child: Text("로그인 페이지 이동"),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                        (route) => false);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
