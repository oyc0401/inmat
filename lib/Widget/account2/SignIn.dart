import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF8C66),
      appBar: AppBar(
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
      body: Column(children: [
        const Expanded(
          child: InMatLoginLogo(),
        ),
        SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 45),
          child: LoginButton(
            text: '카카오로 계속하기',
            onclick: () {},
            color: const Color(0xffFFE26A),
            textColor: const Color(0xff2E2E2E),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 45),
          child: LoginButton(
            text: 'Apple로 계속하기',
            onclick: () {},
            color: const Color(0xff343434),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 45),
          child: LoginButton(
            text: 'Google로 계속하기',
            onclick: () {},
            color: const Color(0xff1570FF),
          ),
        ),
        const SizedBox(
          height: 13,
        ),
        EmailLoginButton(onclick: () {}),
        const SizedBox(
          height: 50,
        ),
        GuestButton(onclick: () {}),
        const SizedBox(
          height: 37,
        ),
      ]),
    );
  }
}

class InMatLoginLogo extends StatelessWidget {
  const InMatLoginLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '인맛',
          style: TextStyle(
            fontSize: 53,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          '인하대 맛집 탐색 어플',
          style: TextStyle(fontSize: 20),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),

          child: InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(100),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '인맛을 소개합니다',
                    style: TextStyle(fontSize: 13),
                  ),
                  Icon(Icons.navigate_next),
                ],
              )),
            ),
          ),
        ),
        Ink(
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
          child: InkWell(
            onTap: (){},
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              width: 56,
              height: 56,
              child: const Icon(Icons.pin_drop, size: 34),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.text,
    required this.onclick,
    required this.color,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String text;
  final VoidCallback onclick;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onclick,
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 52,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 21,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmailLoginButton extends StatelessWidget {
  const EmailLoginButton({
    Key? key,
    required this.onclick,
  }) : super(key: key);
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: const Text(
        '이메일로 로그인/회원가입 >',
        style: TextStyle(fontSize: 18, color: Color(0xff000000)),
      ),
    );
  }
}

class GuestButton extends StatelessWidget {
  const GuestButton({
    Key? key,
    required this.onclick,
  }) : super(key: key);
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclick,
      child: const Text(
        '회원가입 없이 둘러보기',
        style: TextStyle(
            fontSize: 15,
            decoration: TextDecoration.underline,
            color: Color(0xff343434)),
      ),
    );
  }
}
