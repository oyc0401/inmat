import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text('회원가입',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
          ),
          Center(
            child: Container(
              width: 350, height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffF2F2F2),
              ),
              child: Column(
                children: [
                  Container(child: Text('아이디'),),
                  Container(child: Flexible(child: TextField(decoration: InputDecoration(border: OutlineInputBorder()),)), width: 300,),  SizedBox(height: 10,),
                  TextButton(onPressed: () {} , child: Text('아이디 중복확인 ✓',)),
                  Container(child: Text('비밀번호'),),
                  Container(child: Flexible(child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),),)), width: 300,),  SizedBox(height: 10,),
                  Container(child: Flexible(child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: '비밀번호 재입력'),)), width: 300,),  SizedBox(height: 10,),
                  Container(child: Text('이메일'),),
                  Container(child: Flexible(child: TextField(decoration: InputDecoration(border: OutlineInputBorder(),labelText: '확인'),)), width: 300,),  SizedBox(height: 10,),
                  Container(child: Text('계정 분실시 본인인증 정보로 활용됩니다.'),),
                  ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          primary: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )
                      ),
                      child: Text('본인인증하고 가입하기',style: TextStyle(color: Colors.white, fontSize: 30),)),
                  Container(child: Text('본인인증이 어려운 경우(만 14세 포함),'),),
                  TextButton(onPressed: () {} , child: Text('비회원으로 앱을 사용', style: TextStyle(fontWeight: FontWeight.bold),)),Container(child: Text('해보실 수 있습니다'),),

                ],
              ),
            ),
          ),
        ],
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
