import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/utils/toast.dart';
import 'package:provider/provider.dart';

import '../providers/sign_up_model.dart';



class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  SignUpModel signUpModel = SignUpModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpModel>(
      create: (context) => signUpModel,
      child: Scaffold(
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Flexible(
                //   flex: 3,
                //   child: Container(),
                // ),
                SizedBox(
                  height: 40,
                ),
                const Text(
                  '회원가입',
                  style: TextStyle(fontSize: 40),
                ),
                // Flexible(
                //   flex: 1,
                //   child: Container(),
                // ),
                SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SignupBox(),
                ),
                // Flexible(
                //   flex: 3,
                //   child: Container(),
                // ),
                const SizedBox(
                  height: 44,
                ),
                // Padding(
                //   padding: const EdgeInsets.all(30.0),
                //   child: ProfileFormBox(),
                // ),
                ProfileFormBox(),

                // CupertinoButton(
                //   child: Text("이동"),
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       CupertinoPageRoute(
                //         builder: (context) {
                //           return ChangeNotifierProvider<SignUpModel>.value(
                //             value: signUpModel,
                //             child: SignUpTestPage(),
                //           );
                //         },
                //       ),
                //     );
                //   },
                // ),
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

// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   screens build(BuildContext context) {
//     return
//   }
// }

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
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 8.0),
          //   child: IdTextField(
          //     onclick: () {
          //       // Provider.of<SignUpModel>(context, listen: false).checkID();
          //     },
          //     turnOn: Provider.of<SignUpModel>(context).canId,
          //   ),
          // ),
          const PassWordTextField(),
          const SizedBox(height: 20),
          const EmailTextField(),
          const SizedBox(height: 30),
          SignUpButton(
            onclick: () {
              Provider.of<SignUpModel>(context, listen: false).signup();
            },
            turnOn: Provider.of<SignUpModel>(context).canSignUp,
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
  const IdTextField({
    Key? key,
    required this.onclick,
    required this.turnOn,
  }) : super(key: key);

  final VoidCallback onclick;
  final bool turnOn;

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
            // Provider.of<SignUpModel>(context, listen: false).setUsername(text);
          },
        ),
        InkWell(
          onTap: onclick,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                const Text(
                  "아이디 중복확인",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff5F5F5F),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.done,
                    size: 12,
                    color: turnOn ? Colors.blueAccent : const Color(0xff5F5F5F),
                  ),
                ),
              ],
            ),
          ),
        ),
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
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: const OutlineInputBorder(),
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
    required this.turnOn,
  }) : super(key: key);
  final VoidCallback onclick;

  // final Color color;
  // final Color textColor;
  final bool turnOn;

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        color: turnOn ? const Color(0xffFF8C66) : const Color(0xffD9D9D9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          if (turnOn) {
            onclick();
          } else {
            Message.showMessage("정보를 정확히 입력해 주세요.");
          }
        },
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          height: 58,
          child: Center(
            child: Text(
              '본인인증하고 가입하기',
              style: TextStyle(
                color: turnOn ? Colors.white : const Color(0xffB2B2B2),
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
                onTap: () {
                  Message.showMessage("개발 중 입니다.");
                },
                child: const Text(
                  '비회원으로 앱을 사용',
                  style: TextStyle(
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      color: Color(0xff191818)),
                )),
            const Text(
              '해보실 수 있습니다',
              style: TextStyle(
                fontSize: 12,
                color: Color(0xff848484),
              ),
            ),
          ],
        ),
      ],
    );
  }
}



class ProfileFormBox extends StatelessWidget {
  const ProfileFormBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('닉네임', style: TextStyle(fontSize: 20)),
          ),
          TextField(
            onChanged: (text) {
              Provider.of<SignUpModel>(context, listen: false).setNickName(text);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              border: OutlineInputBorder(),
            ),
          ),
          InkWell(
            onTap: () {
              Provider.of<SignUpModel>(context, listen: false).checkNickName();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Row(
                children: [
                  Text(
                    "닉네임 중복확인",
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
                      color: Provider.of<SignUpModel>(context).canNickName
                          ? Colors.blueAccent
                          : Color(0xff5F5F5F),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text('나이', style: TextStyle(fontSize: 20)),
          ),
          TextField(
            onChanged: (text) {
              Provider.of<SignUpModel>(context, listen: false).setAge(text);
            },
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              border: OutlineInputBorder(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  onPressed: () {
                    Provider.of<SignUpModel>(context, listen: false)
                        .setGender("M");
                  },
                  color: Provider.of<SignUpModel>(context).gender == "M"
                      ? Colors.blue
                      : Colors.grey,
                  child: const Text("남"),
                ),
                CupertinoButton(
                  onPressed: () {
                    Provider.of<SignUpModel>(context, listen: false)
                        .setGender("F");
                  },
                  color: Provider.of<SignUpModel>(context).gender == "F"
                      ? Colors.blue
                      : Colors.grey,
                  child: const Text("여"),
                )
              ],
            ),
          ),
          const Text('전화번호', style: TextStyle(fontSize: 20)),
          const SizedBox(
            height: 8,
          ),
          // Row(
          //   children: [
          //     Flexible(
          //       flex: 3,
          //       child: TextField(
          //         onChanged: (text) {
          //           Provider.of<SignUpModel>(context, listen: false)
          //               .setPhoneNumber1(text);
          //         },
          //         decoration: const InputDecoration(
          //           contentPadding:
          //               EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 4),
          //     Flexible(
          //       flex: 4,
          //       child: TextField(
          //         onChanged: (text) {
          //           Provider.of<SignUpModel>(context, listen: false)
          //               .setPhoneNumber2(text);
          //         },
          //         decoration: const InputDecoration(
          //           contentPadding:
          //               EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //     const SizedBox(width: 4),
          //     Flexible(
          //       flex: 4,
          //       child: TextField(
          //         onChanged: (text) {
          //           Provider.of<SignUpModel>(context, listen: false)
          //               .setPhoneNumber3(text);
          //         },
          //         decoration: const InputDecoration(
          //           contentPadding:
          //               EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          //           border: OutlineInputBorder(),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
