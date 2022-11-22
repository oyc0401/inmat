import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/inmat/auth/inmat_account.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';

void showMessage(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

class SignUpForm with ChangeNotifier {
  String _username = "";
  String _password = "";
  String _email = "";

  // int _age = 0;
  String _age = '0';
  String _gender = "";
  String _nickName = "";
  String _phoneNumber1 = "";
  String _phoneNumber2 = "";
  String _phoneNumber3 = "";

  String get username => _username;

  String get password => _password;

  String get email => _email;

  // int get age => _age;
  String get age => _age;

  String get gender => _gender;

  String get nickName => _nickName;

  String get phoneNumber1 => _phoneNumber1;

  String get phoneNumber2 => _phoneNumber2;

  String get phoneNumber3 => _phoneNumber3;

  setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setAge(String age) {
    _age = age;
    notifyListeners();
  }

  // setAge(int age) {
  //   _age = age;
  //   notifyListeners();
  // }

  setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  setNickName(String nickName) {
    _nickName = nickName;
    notifyListeners();
  }

  setPhoneNumber1(String number) {
    _phoneNumber1 = number;
    notifyListeners();
  }

  setPhoneNumber2(String number) {
    _phoneNumber2 = number;
    notifyListeners();
  }

  setPhoneNumber3(String number) {
    _phoneNumber3 = number;
    notifyListeners();
  }

  signup() async {
    print(username);
    print(password);
    print(email);
    print(age);
    print(gender);
    print(nickName);
    print(phoneNumber1);
    print(phoneNumber2);
    print(phoneNumber3);

    try {
      await InMatAccount.registerEmail(
        id: username,
        password: password,
        profile: Profile(
            email: email,
            age: int.parse(age),
            gender: gender,
            nickName: nickName,
            phoneNumber: "$phoneNumber1-$phoneNumber2-$phoneNumber3"),
      );
      showMessage('회원가입 성공');
    } on OverlappingAccount {
      // 아이디 중복 메세지 띄우기
      showMessage('아이디 중복');
    } on OverlappingNickName {
      // 닉네임 중복 메세지 띄우기
      showMessage('닉네임 중복');
    } catch (e) {
      // 오류 메세지 띄우기
      print(e);
      showMessage('$e');
    }
  }
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
        body: ChangeNotifierProvider<SignUpForm>(
          create: (context) => SignUpForm(),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Flexible(
                //   flex: 3,
                //   child: Container(),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '회원가입',
                  style: TextStyle(fontSize: 40),
                ),
                // Flexible(
                //   flex: 1,
                //   child: Container(),
                // ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: SignupFormBox(),
                ),
                // Flexible(
                //   flex: 3,
                //   child: Container(),
                // ),
                const SizedBox(
                  height: 20,
                ),

                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: ProfileFormBox()),
              ],
            ),
          ),
        )

        // 돌아가기 버튼
        // 회원가입
        // 큰 회색 컨테이너
        // 아이디
        // 아이디 입력칸
        // 아이디 중복확인
        // 비밀번호
        // 비밀번호 입력칸
        // 비밀번호 재입력칸
        // 이메일
        // 이메일 입력칸 + 이메일 확인 표시
        // 계정분실시
        // 본인인증하고 가입하기 버튼
        // 본인인증이 어려운 경우
        // 비회원 앱사용 문구
        );
  }
}

class SignupFormBox extends StatelessWidget {
  const SignupFormBox({Key? key}) : super(key: key);

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
            child: IdField(
              onclick: () {},
            ),
          ),
          const PassWordField(),
          const SizedBox(height: 20),
          const EmailField(),
          const SizedBox(height: 30),
          SignUpButton(
            onclick: () {
              Provider.of<SignUpForm>(context, listen: false).signup();
            },
            color: const Color(0xffD9D9D9),
            textColor: const Color(0xffB2B2B2),
          ),
          const SizedBox(
            height: 14,
          ),
          GuestLogin(
            onclick: () {},
          ),
        ],
      ),
    );
  }
}

class ProfileFormBox extends StatelessWidget {
  const ProfileFormBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text('닉네임', style: TextStyle(fontSize: 20)),
        ),
        TextField(
          onChanged: (text) {
            Provider.of<SignUpForm>(context, listen: false).setNickName(text);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(),
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
            Provider.of<SignUpForm>(context, listen: false).setAge(text);
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
                  Provider.of<SignUpForm>(context, listen: false)
                      .setGender("M");
                },
                color: Provider.of<SignUpForm>(context).gender == "M"
                    ? Colors.blue
                    : Colors.grey,
                child: const Text("남"),
              ),
              CupertinoButton(
                onPressed: () {
                  Provider.of<SignUpForm>(context, listen: false)
                      .setGender("F");
                },
                color: Provider.of<SignUpForm>(context).gender == "F"
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
        Row(
          children: [
            Flexible(
              flex: 3,
              child: TextField(
                onChanged: (text) {
                  Provider.of<SignUpForm>(context, listen: false)
                      .setPhoneNumber1(text);
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Flexible(
              flex: 4,
              child: TextField(
                onChanged: (text) {
                  Provider.of<SignUpForm>(context, listen: false)
                      .setPhoneNumber2(text);
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Flexible(
              flex: 4,
              child: TextField(
                onChanged: (text) {
                  Provider.of<SignUpForm>(context, listen: false)
                      .setPhoneNumber3(text);
                },
                decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 50,)
      ],
    );
  }
}

class IdField extends StatelessWidget {
  const IdField({Key? key, required this.onclick}) : super(key: key);

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
        TextField(
          onChanged: (text) {
            Provider.of<SignUpForm>(context, listen: false).setUsername(text);
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
        ),
        InkWell(
          onTap: onclick,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: const [
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

class PassWordField extends StatelessWidget {
  const PassWordField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('비밀번호', style: TextStyle(fontSize: 20)),
        const SizedBox(
          height: 8,
        ),
        TextField(
          onChanged: (text) {
            Provider.of<SignUpForm>(context, listen: false).setPassword(text);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: '비밀번호 재입력',
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          ),
        ),
      ],
    );
  }
}

class EmailField extends StatelessWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('이메일', style: TextStyle(fontSize: 20)),
        const SizedBox(
          height: 8,
        ),
        TextField(
          onChanged: (text) {
            Provider.of<SignUpForm>(context, listen: false).setEmail(text);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(),
          ),
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

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    Key? key,
    required this.onclick,
    required this.color,
    required this.textColor,
  }) : super(key: key);
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
          height: 58,
          child: Center(
            child: Text(
              '본인인증하고 가입하기',
              style: TextStyle(
                color: textColor,
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

class GuestLogin extends StatelessWidget {
  const GuestLogin({
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
