import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'NavigatePage.dart';


class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFF8C66),
      appBar: AppBar(
        backgroundColor: Color(0x00000000),
        elevation: 0,

        iconTheme: IconThemeData(
          color: Colors.black,//색변경
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
             Navigator.pop(context);
            // 뒤로가기 버튼 누르면 이동하는 곳
          },
        ),
      ),
      body: Column(children: [
        SizedBox(height: 120, width: 100,),
        Text('인맛', style: TextStyle(fontSize: 40), ),
        SizedBox(height: 10,),
        Text('인하대 맛집 탐색 어플'),
        SizedBox(height: 10,),
        Container(child: Text('인맛을 소개합니다'),),
        SizedBox(height: 10,),
        Container(
          child: Icon(Icons.location_on_outlined),
        ),
        SizedBox(height: 120, width: 100,),
        Center(
          child:
          Container(
            width: 200, height: 40,
            child: Center(child: Text('카카오로 계속하기')),
            //텍스트를 Center로 감싸는게 나을지 아니면 가운데정렬 다른방법이 더 좋을지??
            decoration: BoxDecoration( color: Colors.yellow),
          ),
         ),
        SizedBox(height: 10,),
         Container(
          child: Container(
            width: 200, height: 40,
            child: Center(child: Text('Apple로 계속하기', style: TextStyle(color: Colors.white), )),
            decoration: BoxDecoration( color: Colors.black ,),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child: Container(
            width: 200, height: 40,
            child: Center(child: Text('Google로 계속하기' , style: TextStyle(color: Colors.white))),
            decoration: BoxDecoration( color: Colors.blue),
          ),
        ),
        SizedBox(height: 10,),
        Container(child: Text(' 이메일로 로그인/회원가입 > '),),
        SizedBox(height: 40,),
        Container(child: Text(' 회원가입 없이 둘러보기'),)


        // CupertinoButton(
        //     child: Text("메인 페이지 이동"),
        //     onPressed: () {
        //       Navigator.pushAndRemoveUntil(
        //           context,
        //           CupertinoPageRoute(
        //             builder: (context) => const NavigatePage(),
        //           ),
        //           (route) => false);
        //     }),

      ]),
    );
  }
}
