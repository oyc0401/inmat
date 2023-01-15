import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

class WritePost extends StatefulWidget {
  WritePost({Key? key}) : super(key: key);

  @override
  State<WritePost> createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  String title = '';
  String content = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('게시물 작성'),
        actions: [
          IconButton(
            onPressed: () {
              if (title != '' && content != '') {
                InMatApi.community.writePost(title: title, content: content);
              } else {
                _showDialog();
              }
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              onChanged: (text) {
                title = text;
              },
              style: const TextStyle(fontWeight: FontWeight.bold),
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: null,
              decoration: const InputDecoration(
                  hintStyle: TextStyle(fontWeight: FontWeight.normal),
                  hintText: "제목을 입력하세요.",
                  border: InputBorder.none),
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.grey,
            ),
            TextField(
              onChanged: (text) {
                content = text;
              },
              keyboardType: TextInputType.multiline,
              minLines: 4,
              maxLines: null,
              decoration: const InputDecoration(
                  hintText: "내용을 입력하세요.", border: InputBorder.none),
            ),
            Container(
              height: 500,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: const Text("알림"),
          content: const Text("내용을 입력하세요."),
          actions: <Widget>[
            CupertinoButton(
              child: const Text("확인"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}