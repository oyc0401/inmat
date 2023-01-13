import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/screens/account/sign_in_email/sign_in_email_page.dart';
import 'package:inmat/utils/toast.dart';
import 'package:inmat/widgets/account/line_text_button.dart';
import 'package:inmat/widgets/account/round_button.dart';
import 'package:inmat/widgets/account/custom_text_button.dart';
import 'package:inmat/widgets/ink_button.dart';

import 'google_sign_in.dart';

class SignInMainPage extends StatefulWidget {
  const SignInMainPage({Key? key}) : super(key: key);

  @override
  State<SignInMainPage> createState() => _SignInMainPageState();
}

class _SignInMainPageState extends State<SignInMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF8C66),
      appBar: AppBar(
        // toolbarHeight: 55,
        backgroundColor: const Color(0x00000000),
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //색변경
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
            // 뒤로가기 버튼 누르면 이동하는 곳
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            Flexible(
              flex: 135 - (55),
              child: Container(),
            ),
            logoSection(),
            Flexible(
              flex: 100,
              child: Container(),
            ),
            socialLoginSection(),
          ]),
        ),
      ),
    );
  }

  Widget logoSection() {
    return Container(
      // color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '인맛',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            '인하대 맛집 탐색 어플',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 25,
          ),

          ElevateInkButton(
              onclick: () {
                Message.showMessage("개발 중 입니다.");
              },
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0.0, 3.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),
              inkBorderRadius: BorderRadius.circular(100),
              child: Icon(
                Icons.pin_drop,
                size: 25,
                color: Color(0xff434343),
              )),
        ],
      ),
    );
  }

  Widget socialLoginSection() {
    return Column(
      children: [
        SocialLoginButton(
          text: '카카오로 계속하기',
          onclick: () {
            Message.showMessage("개발 중 입니다.");
          },
          color: const Color(0xffFFE26A),
          textColor: const Color(0xff2E2E2E),
        ),
        const SizedBox(height: 18),
        SocialLoginButton(
          text: 'Apple로 계속하기',
          onclick: () {
            Message.showMessage("개발 중 입니다.");
          },
          color: const Color(0xff343434),
        ),
        const SizedBox(height: 18),
        SocialLoginButton(
          text: 'Google로 계속하기',
          onclick: () {
            GoogleLogin google = GoogleLogin();
            google.login();
            // showMessage();
          },
          color: const Color(0xff1570FF),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomTextButton(
          const Text(
            '이메일로 로그인/회원가입 >',
            style: TextStyle(fontSize: 16, color: Color(0xff000000)),
          ),
          onclick: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => const EmailSignInPage()),
            );
          },
        ),
        const SizedBox(
          height: 41,
        ),
        CustomTextButton(
          const Text(
            '회원가입 없이 둘러보기',
            style: TextStyle(
                fontSize: 15,
                decoration: TextDecoration.underline,
                color: Color(0xff343434)),
          ),
          onclick: () {
            Message.showMessage("개발 중 입니다.");
          },
        ),
        const SizedBox(
          height: 22,
        ),
      ],
    );
  }
}
