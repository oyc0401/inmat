import 'package:flutter/material.dart';

class PasswordFind extends StatefulWidget {
  const PasswordFind({Key? key}) : super(key: key);

  @override
  State<PasswordFind> createState() => _PasswordFindState();
}

class _PasswordFindState extends State<PasswordFind> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFFFF),
        iconTheme: IconThemeData(
          color: Colors.black, //색변경
        ),
        title: Text(
          '비밀번호 찾기',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(Icons.arrow_back_ios_new_outlined),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Text(
                '이메일 인증',
                style: TextStyle(fontSize: 50),
              ),
              // decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), border: Border.all(color: Colors.black,width: 3)),
            ),
            Container(
              height: 1.0,
              width: 500.0,
              color: Colors.black,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                '아이디',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              child: Flexible(
                  child: TextField(
                // controller: _controller ,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  // suffixIcon: IconButton(
                  //   onPressed: () => _controller.clear(),
                  //   icon: Icon(Icons.clear),
                  // ),
                ),
              )),
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                '휴대폰 번호',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              child: Flexible(
                  child: TextField(
                decoration: InputDecoration(border: OutlineInputBorder()),
              )),
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text('확인')),
          ],
        ),
      ),
    );
  }
}
