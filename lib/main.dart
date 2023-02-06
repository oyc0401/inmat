
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inmat/_sample/s3/s3.dart';

import 'package:inmat/inmat/auth/Inmat_token.dart';

import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/manager/add_restaurant.dart';
import 'package:inmat/src/community/main/providers/community_view_model.dart';
import 'package:provider/provider.dart';

import 'auth_check.dart';
import 'src/account/login_main/signin_page.dart';
import 'src/navigator/NavigatePage.dart';

void main() async {
  // DB에서 유저 정보 가져오기
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await InmatAuth.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    getMobileId();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => CommunityViewModel()),
      ],
      child: MaterialApp(
        title: '인맛',
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        ),
        theme: ThemeData(
          fontFamily: 'Binggrae2',
          useMaterial3: true,
        ),
        // home: productMode(),
        home: const AuthCheck(),
        // home: CameraExample(),
        // home :const AddRestaurant(),
        // home: S3Example(),
      ),
    );
  }

  Widget productMode() {


    switch (InmatAuth.instance.status) {
      case AuthStatus.user:
        return const NavigatePage();
      case AuthStatus.guest:
      case AuthStatus.reSignIn:
        return const SignInMainPage();
    }
  }

  Future<String?> getMobileId() async {
    // DeviceInfoPlugin 클래스 생성
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    // id 저장할 변수
    String? id = '';
    try {
      // 플랫폼 확인
      if (Platform.isAndroid) {
        // 안드로이드의 경우 androidInfo를 이용
        // 이때 await으로 데이터 받을때까지 대기를 해야함
        final AndroidDeviceInfo androidData = await deviceInfoPlugin.androidInfo;
        // 전달 받은 변수의 멤버 변수인 androidId가 고유 id이다.
        id = androidData.id;
      } else if (Platform.isIOS) {
        // iOS의 경우 iosInfo를 이용
        // 이때 await으로 데이터 받을때까지 대기를 해야함
        final IosDeviceInfo iosData = await deviceInfoPlugin.iosInfo;
        // 전달 받은 변수의 멤버 변수인 identifierForVendor가 고유 id이다.
        id = iosData.identifierForVendor;
      }
    } on PlatformException {
      // 어떠한 원인으로 실패할 경우
      id = '';
    }
    // id 한번 출력해보고
    print('id: $id');
    // 값 리턴
    return id;
  }



}

//test1234
//shywie@gmail.com
