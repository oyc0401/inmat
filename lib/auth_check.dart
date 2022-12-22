import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/Widget/NavigatePage.dart';
import 'package:restaurant/inmat/auth/inmat_auth.dart';
import 'package:restaurant/inmat/auth/user_model.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';


//
import 'package:ios_utsname_ext/extension.dart';
import 'package:restaurant/widget/account/change_profile/change_profile.dart';

import 'Widget/account/sign_in_choose/signin_page.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    User? user = InMatAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("회원 체크"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child:  Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(),
              Text("user information: ${user ?? "null"}"),
              Text("현재 상태: ${InMatAuth.instance.status}",style: TextStyle(fontSize: 18),),
              IconButton(
                onPressed: () {
                  print("새로고침");
                  setState(() {});
                },
                color: Colors.blue,
                iconSize: 48,
                icon: const Icon(
                  Icons.refresh,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Colors.green,
                  child: const Text("로그인 페이지 이동"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const SignInPage(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Colors.redAccent,
                  child: const Text("로그아웃"),
                  onPressed: () {
                    setState(() {
                      InMatAuth.instance.signOut();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Colors.yellow,
                  child: const Text(
                    "회원 정보 수정",
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const ChangeProfile(),
                      ),
                    );


                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  color: Colors.blueAccent,
                  child: const Text("메인 페이지 이동"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const NavigatePage(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ScreenInfo(
                thiscontext: context,
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CupertinoButton(
              //       color: Colors.grey,
              //       child: Text("로그인 페이지 2 이동"),
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           CupertinoPageRoute(
              //             builder: (context) => const EmailSignInPage(),
              //           ),
              //         );
              //       }),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CupertinoButton(
              //     color: Colors.grey,
              //     child: Text("회원가입 페이지 이동"),
              //     onPressed: () {
              //       Navigator.push(
              //         context,
              //         CupertinoPageRoute(
              //           builder: (context) => const SignUpPage(),
              //         ),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: CupertinoButton(
              //       color: Colors.grey,
              //       child: Text("비밀번호 찾기 페이지 이동"),
              //       onPressed: () {
              //         Navigator.push(
              //           context,
              //           CupertinoPageRoute(
              //             builder: (context) => const PasswordFind(),
              //           ),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenInfo extends StatefulWidget {
  ScreenInfo({
    Key? key,
    required this.thiscontext,
  }) : super(key: key);

  BuildContext thiscontext;

  @override
  State<ScreenInfo> createState() => _ScreenInfoState();
}

class _ScreenInfoState extends State<ScreenInfo> {
  @override
  void initState() {
    super.initState();
    init();
  }

  String osVersion = "";
  String deviceName = "";

  init() async {
    try {
      if (Platform.isAndroid) {
        var info = await DeviceInfoPlugin().androidInfo;
        // deviceName = _readAndroidDeviceInfo(await deviceInfoPlugin.androidInfo);
        var release = info.version.release;
        var sdkInt = info.version.sdkInt;
        var manufacturer = info.manufacturer;
        var model = info.model;
        print("OS 버전: Android $release (SDK $sdkInt)");
        print("기기: $manufacturer $model");
        deviceName = "$manufacturer $model";
        osVersion = "Android $release (SDK $sdkInt)";
      } else if (Platform.isIOS) {
        var info = await DeviceInfoPlugin().iosInfo;
        var systemName = info.systemName;
        var version = info.systemVersion;
        var machine = info.utsname.machine?.iOSProductName;
        // print("$systemName $version");
        // print("$machine");
        deviceName = "$machine";
        osVersion = "$systemName $version";
      }
    } catch (error) {
      print(error);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double safePaddingTop = MediaQuery.of(widget.thiscontext).padding.top;
    double safePaddingBottom = MediaQuery.of(widget.thiscontext).padding.bottom;
    double safePaddingLeft = MediaQuery.of(widget.thiscontext).padding.left;
    double safePaddingRight = MediaQuery.of(widget.thiscontext).padding.right;

    double appBarHeight = AppBar().preferredSize.height;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        // border: BoxBorder(),
        color: Color(0xffefefef),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(),
          Text(osVersion),
          Text(deviceName),
          SizedBox(height: 8),
          Text("viewport: ${width.round()} x ${height.round()}"),
          SizedBox(height: 8),
          Text("safe area:"),
          Text(
              "left: ${safePaddingLeft.round()} top: ${safePaddingTop.round()}, "
              "right: ${safePaddingRight.round()} bottom: ${safePaddingBottom.round()}"),
          SizedBox(height: 8),
          Text("app bar height: $appBarHeight"),
        ],
      ),
    );
  }
}
