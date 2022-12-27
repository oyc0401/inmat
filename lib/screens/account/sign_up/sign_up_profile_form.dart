import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'sign_up_model.dart';

void showMessage(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

class SignUpTestPage extends StatelessWidget {
  const SignUpTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: ProfileFormBox(),),);
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
            Provider.of<SignUpModel>(context, listen: false).setNickName(text);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            border: OutlineInputBorder(),
          ),
        ),
        InkWell(
          onTap: (){
            Provider.of<SignUpModel>(context,listen: false).checkNickName();
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
        Row(
          children: [
            Flexible(
              flex: 3,
              child: TextField(
                onChanged: (text) {
                  Provider.of<SignUpModel>(context, listen: false)
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
                  Provider.of<SignUpModel>(context, listen: false)
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
                  Provider.of<SignUpModel>(context, listen: false)
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
        SizedBox(
          height: 50,
        )
      ],
    );
  }
}
