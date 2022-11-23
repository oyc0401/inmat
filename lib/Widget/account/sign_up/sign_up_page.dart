import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'sign_up_model.dart';
import 'sign_up_profile_form.dart';

void showMessage(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
      body: SafeArea(
        child: ChangeNotifierProvider<SignUpModel>(
          create: (context) => SignUpModel(),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 3,
                  child: Container(),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Text(
                  '회원가입',
                  style: TextStyle(fontSize: 40),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                // SizedBox(
                //   height: 20,
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SignupBox(),
                ),
                // Flexible(
                //   flex: 3,
                //   child: Container(),
                // ),
                SizedBox(
                  height: 44,
                ),

                // Padding(
                //     padding: EdgeInsets.symmetric(horizontal: 30),
                //     child: ProfileFormBox()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignupBox extends StatelessWidget {
  const SignupBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42),
        color: const Color(0xffF2F2F2),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: IdTextField(
              onclick: () {
                Provider.of<SignUpModel>(context, listen: false).checkID();
              },
            ),
          ),
          const PassWordTextField(),
          const SizedBox(height: 20),
          const EmailTextField(),
          const SizedBox(height: 30),
          SignUpButton(
            onclick: () {
              Provider.of<SignUpModel>(context, listen: false).signup();
            },
            on: Provider.of<SignUpModel>(context).canSignUp,
          ),
          const SizedBox(
            height: 14,
          ),
          GuestLoginText(
            onclick: () {},
          ),
        ],
      ),
    );
  }
}


class IdTextField extends StatelessWidget {
  const IdTextField({Key? key, required this.onclick}) : super(key: key);

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('아이디', style: TextStyle(fontSize: 20)),
        const SizedBox(
          height: 8,
        ),
        SignUpTextField(
          onChanged: (text) {
            Provider.of<SignUpModel>(context, listen: false).setUsername(text);
          },
        ),
        InkWell(
          onTap: onclick,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                Text(
                  "아이디 중복확인",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff5F5F5F),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.done,
                    size: 12,
                    color: Provider.of<SignUpModel>(context).canId
                        ? Colors.blueAccent
                        : Color(0xff5F5F5F),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PassWordTextField extends StatelessWidget {
  const PassWordTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('비밀번호', style: TextStyle(fontSize: 20)),
        const SizedBox(
          height: 8,
        ),
        SignUpTextField(
          onChanged: (text) {
            Provider.of<SignUpModel>(context, listen: false).setPassword(text);
          },
        ),
        const SizedBox(height: 10),
        SignUpTextField(
          labelHint: "비밀번호 재입력",
          onChanged: (text) {
            Provider.of<SignUpModel>(context, listen: false)
                .setRePassword(text);
          },
        ),
      ],
    );
  }
}

class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('이메일', style: TextStyle(fontSize: 20)),
        const SizedBox(
          height: 8,
        ),
        SignUpTextField(
          onChanged: (text) {
            Provider.of<SignUpModel>(context, listen: false).setEmail(text);
          },
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 6.0),
          child: Text(
            '계정 분실시 본인인증 정보로 활용됩니다.',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff5F5F5F),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({
    Key? key,
    required this.onChanged,
    this.labelHint,
  }) : super(key: key);
  final ValueChanged<String> onChanged;

  final String? labelHint;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: OutlineInputBorder(),
        labelText: labelHint,
      ),
    );
  }
}


class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.onclick,
    // required this.color,
    // required this.textColor,
    required this.on,
  }) : super(key: key);
  final VoidCallback onclick;

  // final Color color;
  // final Color textColor;
  final bool on;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: on ? Color(0xffFF8C66) : Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: onclick,
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 58,
          child: Center(
            child: Text(
              '본인인증하고 가입하기',
              style: TextStyle(
                color: on ? Colors.white : Color(0xffB2B2B2),
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GuestLoginText extends StatelessWidget {
  const GuestLoginText({
    Key? key,
    required this.onclick,
  }) : super(key: key);

  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          '본인인증이 어려운 경우(만 14세 포함),',
          style: TextStyle(
            fontSize: 15,
            color: Color(0xff848484),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {},
                child: const Text(
                  '비회원으로 앱을 사용',
                  style: TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.underline,
                      color: Color(0xff191818)),
                )),
            const Text(
              '해보실 수 있습니다',
              style: TextStyle(
                fontSize: 15,
                color: Color(0xff848484),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
