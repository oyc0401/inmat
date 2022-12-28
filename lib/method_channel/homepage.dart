import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String CHANNEL = 'com.yumyum.inmat/channels';
  static const platform = MethodChannel(CHANNEL);

  _openNativeActivity() async {
    try {
      await platform.invokeMethod("goToSecondActivity");
    } on PlatformException catch (e) {
      print(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Native View"),
      ),
      body: Center(
        child: CupertinoButton(
          onPressed: () {
            _openNativeActivity();
          },
          child: Text("open activity"),
        ),
      ),
    );
  }
}
