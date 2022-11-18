import 'package:flutter/material.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(),
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              // Navigator.pop(context);
              // 뒤로가기 버튼 누르면 이동하는 곳
            },
          ),
          SizedBox(height: 40,),
          Container(
            child: Text('LOG IN', style: TextStyle(fontSize: 40),),
          ), SizedBox(height: 30,),
          Center(
            child: Container(
              width: 350, height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                color: Color(0xffF2F2F2),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30,),
                  Container(child: Text('이메일 아이디',style: TextStyle(fontSize: 20), textAlign: TextAlign.left,),), // Column 안에 컨테이너 안에 텍스트 좌측정렬 하려면?
                  Container(child: Flexible(child: TextField()), width: 300,),  SizedBox(height: 10,),
                  Container(child: Text('Forgot your ID?'),), SizedBox(height: 30,),
                  Container(child: Text('비밀번호', style: TextStyle(fontSize: 20),),),
                  Container(child: Flexible(child: TextField()), width: 300,), SizedBox(height: 10,),
                  Container(child: Text('Forgot password?'),), SizedBox(height: 30,),
                  ElevatedButton(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(300, 50),
                        primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      child: Text('Log In')),
                  // Container(
                  //   color: Colors.orange,
                  //   child: Text('Log In'),
                  // ),
                ],
              ),
            ),
          ),
          SizedBox(height: 80,),
          Container(child: Text('회원이 아니세요?'),),
          ElevatedButton(onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(300, 50),
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.orange)

                  )
              ),
              child: Text('회원가입', style: TextStyle(color: Colors.orange))
          )
        ],
      ),
    );
  }
}
