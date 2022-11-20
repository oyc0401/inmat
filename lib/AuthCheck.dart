import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Widget/NavigatePage.dart';
import 'package:restaurant/inmat/auth/inmat_auth.dart';
import 'package:restaurant/inmat/auth/user_model.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';

import 'Widget/Account/ChooseSignIn.dart';
import 'Widget/account2/SignIn.dart';
import 'Widget/account2/SignIn2.dart';
import 'Widget/account2/SignUp.dart';
import 'Widget/account2/PasswordFind.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    User? user = InMatAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text("회원 체크"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("user information: ${user ?? "null"}"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.green,
                    child: Text("로그인"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const ChooseSignIn(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.redAccent,
                    child: Text("로그아웃"),
                    onPressed: () {
                      InMatAuth.instance.signOut();
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.yellow,
                    child: Text("회원 정보 수정",style: TextStyle(color: Colors.black),),
                    onPressed: () async {
                      try {
                        await InMatAuth.instance.updateProfile({
                          "age": 20,
                          "gender": "F",
                        });
                      } on ExpirationAccessToken {
                        // 액세스 토큰 만료: 로그아웃 후 다시 로그인
                      } on AccessDenied {
                        // 접근 권한 없음
                      } on OverlappingNickName {
                        // 닉네임 중복 알림
                      } catch (e) {
                        print(e);
                        // 오류 메세지 알림
                      }
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.blue,
                    child: Text("새로고침"),
                    onPressed: () {
                      setState(() {

                      });
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.grey,
                    child: Text("메인 페이지 이동"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const NavigatePage(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.grey,
                    child: Text("로그인 페이지 1 이동"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignIn(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.grey,
                    child: Text("로그인 페이지 2 이동"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignIn2(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.grey,
                    child: Text("회원가입 페이지 이동"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const SignUp(),
                        ),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                    color: Colors.grey,
                    child: Text("비밀번호 찾기 페이지 이동"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const PasswordFind(),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

