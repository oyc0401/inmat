import 'package:flutter/material.dart';

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 3,
              child: Container(),
            ),
            const Text(
              '회원가입',
              style: TextStyle(fontSize: 40),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Ink(
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
                      onclick: () {},
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
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(),
            ),
          ],
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
        const TextField(
          decoration: InputDecoration(
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
      children: const [
        Text('비밀번호', style: TextStyle(fontSize: 20)),
        SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(),
          ),
        ),
        SizedBox(height: 10),
        TextField(
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
      children: const [
        Text('이메일', style: TextStyle(fontSize: 20)),
        SizedBox(
          height: 8,
        ),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(),
          ),
        ),
        Padding(
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
