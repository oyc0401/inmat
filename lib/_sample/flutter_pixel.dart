import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PixelPage(),
    );
  }
}

class PixelPage extends StatefulWidget {
  PixelPage({Key? key}) : super(key: key);

  @override
  State<PixelPage> createState() => _PixelPageState();
}

class _PixelPageState extends State<PixelPage> {
  double width = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 200),
            child: Container(
              width: width,
              height: 150,
              color: Colors.black,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('width: $width'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    width += 0.01;
                  });
                },
                child: Text("0.01 ▲"),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    width -= 0.01;
                  });
                },
                child: Text("0.01 ▼"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    width += 0.1;
                  });
                },
                child: Text("0.1 ▲"),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    width -= 0.1;
                  });
                },
                child: Text("0.1 ▼"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    width += 1;
                  });
                },
                child: Text("1 ▲"),
              ),
              CupertinoButton(
                onPressed: () {
                  setState(() {
                    width -= 1;
                  });
                },
                child: Text("1 ▼"),
              ),

            ],
          ),
          CupertinoButton(
            onPressed: () {
              setState(() {
                width =1;
              });
            },
            child: Text("set 1"),
          ),
          CupertinoButton(
            onPressed: () {
              setState(() {
                width = 0.5;
              });
            },
            child: Text("set 0.5"),
          ),
          CupertinoButton(
            onPressed: () {
              setState(() {
                width =0.25;
              });
            },
            child: Text("set 0.25"),
          ),
          CupertinoButton(
            onPressed: () {
              setState(() {
                width =0.3;
              });
            },
            child: Text("set 0.3"),
          ),
        ],
      ),
    );
  }
}
