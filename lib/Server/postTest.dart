import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String text = "";

  void onClick() async {
    getHttp get =
        getHttp(uri: Uri.parse("http://prod.sogogi.shop:9000/admin/users"));
    Map<String, dynamic> json = await get.parse();

    setState(() {
      print(json);
    });
    text = json.toString();
    print(json['message']);

    getHttp get2 = getHttp(
        uri: Uri.parse("http://prod.sogogi.shop:9000/posts/7?pageIndex=1"));
    Map<String, dynamic> json2 = await get2.parse();
    print(json2);
  }

  void send() async {
    Uri uri = Uri.parse("http://prod.sogogi.shop:9000/posts/7");
    String token =
        'eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo3LCJpYXQiOjE2NjM0MDcwNDQsImV4cCI6MTY2MzQwOTYzNn0.L1EjUbJ7yS3oPRzX_T5B7sx0Aek7pbIqu9Pv0aq_2cY';

    Map map = {
      "contents": "내용",
      "postImgList": ["이미지?"]
    };
    var body = json.encode(map);
    final Response response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: "Basic $token"
      },
      body: body,
    );

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      print(json.decode(utf8.decode(response.bodyBytes)));
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> get() async {
    Uri uri = Uri.parse("http://prod.sogogi.shop:9000/admin/users");
    String token =
        'eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo3LCJpYXQiOjE2NjM0MDcwNDQsImV4cCI6MTY2MzQwOTYzNn0.L1EjUbJ7yS3oPRzX_T5B7sx0Aek7pbIqu9Pv0aq_2cY';

    // 요청하기
    final Response response = await http.get(
      uri,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "X-ACCESS-TOKEN": "$token"
      },
    );

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            CupertinoButton(
                child: Text("불러오기"),
                onPressed: () {
                  onClick();
                  //send();
                }),
            Text(
              text,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
    );
  }
}

// 가져오는 클래스
class getHttp {
  getHttp({this.uri});

  Uri? uri;

  /// json 얻기
  Future<Map<String, dynamic>> parse() async {
    assert(uri != null, "uri 가 입력되지 않았습니다.");
    String token =
        'eyJ0eXBlIjoiand0IiwiYWxnIjoiSFMyNTYifQ.eyJ1c2VySWR4Ijo3LCJpYXQiOjE2NjM0MDcwNDQsImV4cCI6MTY2MzQwOTYzNn0.L1EjUbJ7yS3oPRzX_T5B7sx0Aek7pbIqu9Pv0aq_2cY';
    uri ??= Uri.parse("");

    // 요청하기
    final Response response = await http.get(
      uri!,
      headers: {
        "Content-Type": "application/json",
        'Accept': 'application/json',
        "X-ACCESS-TOKEN": "$token",
      },
    );

    // 요청 성공하면 리턴
    if (response.statusCode == 200) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
