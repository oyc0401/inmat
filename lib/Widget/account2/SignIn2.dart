import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showMessage() {
  Fluttertoast.showToast(
      msg: "개발 중 입니다.",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

class SignIn2 extends StatefulWidget {
  const SignIn2({Key? key}) : super(key: key);

  @override
  State<SignIn2> createState() => _SignIn2State();
}

class _SignIn2State extends State<SignIn2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Container(),
          ),
          const Padding(
            padding: EdgeInsets.all(19.0),
            child: Text(
              'LOG IN',
              style: TextStyle(fontSize: 40),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: LoginBox(),
          ),
          Flexible(
            flex: 3,
            child: Container(),
          ),
          const Padding(
            padding: EdgeInsets.all(6.0),
            child: Text(
              '회원이 아니세요?',
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 64),
            child: RegisterButton(
              onclick: () {
                showMessage();
              },
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(),
          ),
        ],
      ),
    );
  }
}

class LoginBox extends StatelessWidget {
  const LoginBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xffF2F2F2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 38, vertical: 30),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: const [
            Text('아이디', style: TextStyle(fontSize: 20))
          ]), // Column 안에 컨테이너 안에 텍스트 좌측정렬 하려면?
          const TextField(),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: InkWell(
              onTap: () {
                showMessage();
              },
              child: const Text('Forgot your ID?'),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(children: const [Text('비밀번호', style: TextStyle(fontSize: 20))]),
          const TextField(obscureText: true),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: InkWell(
              onTap: () {
                showMessage();
              },
              child: const Text('Forgot password?'),
            ),
          ),
          const SizedBox(height: 36),
          LoginButton(
            onclick: () {
              showMessage();
            },
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.onclick,
    this.outlined = false,
  }) : super(key: key);

  final VoidCallback onclick;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: outlined ? Colors.white : const Color(0xffff8c66),
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: const Color(0xffff8c66), width: 1.5),
      ),
      child: InkWell(
        onTap: onclick,
        borderRadius: BorderRadius.circular(19),
        child: SizedBox(
          height: 60,
          child: Center(
            child: Text(
              outlined ? "회원가입" : "Log In",
              style: TextStyle(
                color: outlined ? const Color(0xffff8c66) : Colors.white,
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({
    Key? key,
    required this.onclick,
  }) : super(key: key);

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: const Color(0xffff8c66), width: 1.5),
      ),
      child: InkWell(
        onTap: onclick,
        borderRadius: BorderRadius.circular(19),
        child: const SizedBox(
          height: 60,
          child: Center(
            child: Text(
              "회원가입",
              style: TextStyle(
                color: Color(0xffff8c66),
                fontSize: 23,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
