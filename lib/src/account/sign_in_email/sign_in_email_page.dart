import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/utils/inmat_colors.dart';
import 'package:inmat/utils/toast.dart';

import 'package:provider/provider.dart';

import '../../navigator/NavigatePage.dart';
import '../sign_up_email/sign_up_page.dart';
import '../widget/round_button.dart';
import 'sign_in_email_model.dart';

class EmailSignInPage extends StatefulWidget {
  const EmailSignInPage({Key? key}) : super(key: key);

  @override
  State<EmailSignInPage> createState() => _EmailSignInPageState();
}

class _EmailSignInPageState extends State<EmailSignInPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EmailSignInModel>(
      create: (context) => EmailSignInModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '로그인',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                const Text('아이디', style: TextStyle(fontSize: 16)),
                SizedBox(height: 10),
                const IDForm(),
                SizedBox(height: 8),
                ForgotButton(
                  onclick: () {
                    Message.showMessage('개발 중 입니다.');
                  },
                  text: "Forgot your ID?",
                ),
                SizedBox(height: 16),
                const Text('비밀번호', style: TextStyle(fontSize: 20)),
                SizedBox(height: 10),
                const PasswordTextForm(),
                SizedBox(height: 8),
                ForgotButton(
                  onclick: () {
                    Message.showMessage('개발 중 입니다.');
                  },
                  text: "Forgot password?",
                ),
                const SizedBox(height: 30),
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
                Spacer(),
                Container(
                  width: double.infinity,
                  child: Text(
                    '회원이 아니세요?',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 9),
                RegisterButton(
                  onclick: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                ),
                SizedBox(height: 15),
              ],
            ),
          ),
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
        children: [],
      ),
    );
  }
}

class IDForm extends StatelessWidget {
  const IDForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "test123",

      decoration: const InputDecoration(


        border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(Radius.circular(13))),
      ),
      onChanged: (text) {
        Provider.of<EmailSignInModel>(context, listen: false).setUsername(text);
      },
    );
  }
}

class PasswordTextForm extends StatelessWidget {
  const PasswordTextForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: "qwe12345&&",
      obscureText: true,
      onChanged: (text) {
        Provider.of<EmailSignInModel>(context, listen: false).setPassword(text);
      },
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
    return InkWell(
      onTap: onclick,
      child: Container(
        width: double.infinity,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: Color(0xff272727),
          ),
        ),
      ),
    );
  }
}
