
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inmat/_sample/s3/s3.dart';

import 'package:inmat/inmat/auth/Inmat_token.dart';

import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_library.dart';
import 'package:inmat/manager/add_restaurant.dart';
import 'package:inmat/src/community/main/providers/community_view_model.dart';
import 'package:provider/provider.dart';

import 'auth_check.dart';
import 'src/account/login_main/signin_page.dart';
import 'src/navigator/NavigatePage.dart';

void main() async {
  // DB에서 유저 정보 가져오기
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Inmat.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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


    switch (Inmat.user.authStatus) {
      case AuthStatus.user:
        return const NavigatePage();
      case AuthStatus.guest:
      case AuthStatus.reSignIn:
        return const SignInMainPage();
    }
  }




}

//test1234
//shywie@gmail.com
