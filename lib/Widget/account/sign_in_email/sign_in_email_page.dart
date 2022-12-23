import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/widget/main/NavigatePage.dart';

import '../../../main.dart';
import '../sign_up/sign_up_page.dart';
import 'email_sign_in_model.dart';

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
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
      body: ChangeNotifierProvider<EmailSignInModel>(
        create: (context) => EmailSignInModel(),
        child: Column(
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
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => SignUpPage()),
                  );
                },
              ),
            ),
            Flexible(
              flex: 6,
              child: Container(),
            ),
          ],
        ),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IDTextForm(),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ForgotButton(
              onclick: () {
                Useful.showMessage('개발 중 입니다.');
              },
              text: "Forgot your ID?",
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const PasswordTextForm(),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: ForgotButton(
              onclick: () {
                Useful.showMessage('개발 중 입니다.');
              },
              text: "Forgot password?",
            ),
          ),
          const SizedBox(height: 36),
          LoginButton(
            onclick: () async {
              await Provider.of<EmailSignInModel>(context, listen: false)
                  .signIn();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => NavigatePage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

class IDTextForm extends StatelessWidget {
  const IDTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('아이디', style: TextStyle(fontSize: 20)),
        TextFormField(
          initialValue: "test123",
          onChanged: (text) {
            Provider.of<EmailSignInModel>(context, listen: false)
                .setUsername(text);
          },
        )
      ],
    );
  }
}

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('비밀번호', style: TextStyle(fontSize: 20)),
        TextFormField(
          initialValue: "qwe12345&&",
          obscureText: true,
          onChanged: (text) {
            Provider.of<EmailSignInModel>(context, listen: false)
                .setPassword(text);
          },
        )
      ],
    );
  }
}

class ForgotButton extends StatelessWidget {
  const ForgotButton({
    Key? key,
    required this.onclick,
    required this.text,
  }) : super(key: key);

  final VoidCallback onclick;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: onclick,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff272727),
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
