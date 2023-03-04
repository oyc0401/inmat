import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat.dart';
import 'package:inmat/inmat/inmat_data.dart';

import 'package:inmat/src/community/providers/community_view_model.dart';
import 'package:provider/provider.dart';

import 'auth_check.dart';
import 'inmat/models/token_model.dart';
import 'src/account/screens/sign_in_main_page.dart';
import 'src/navigator/NavigatePage.dart';
import 'utils/navigator_context.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakao;

void main() async {
  // DB에서 유저 정보 가져오기
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // Token testToken = Token(
  //   accessToken:
  //       "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmbHV0dGVyMSIsImF1dGgiOiJST0xFX1VTRVIiLCJleHAiOjE2NzUyNTg2Nzd9.cz_hPcfxRmGbxjLAFhus7Q-_GhL5oZ5bSgzecNV95pF82fvTpB_KJ9p-Etnj3IdSMU6U-3iyfASmZUvhBeWdZQ",
  //   refreshToken:
  //       "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJmbHV0dGVyMSIsImF1dGgiOiJST0xFX1VTRVIiLCJleHAiOjE2NzUyNzEyMTd9.Rn_qBBydqgHDeEKvk0__T8iSvUYDrzqgjFEGv2nMF-NSegCNR_-L382zLIJppP0dSh_BIa22WZQlAjy07oJdsg",
  // );
  // Inmat.testInitial(testToken);

  await Inmat.initialize();

  kakao.KakaoSdk.init(nativeAppKey: '405c325522945902e2860008ec451ea0');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '인맛',
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      },
      theme: ThemeData(
        fontFamily: 'Binggrae2',
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          scrolledUnderElevation: 1,
          shadowColor: Colors.black,
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Color(0xff262626)),
        ),
      ),
      home: const MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NavigatorContext.setContext(Navigator.of(context).context);
    return productMode();
    // return const AuthCheck();
    //  return const AddRestaurant();
    // return CameraExample();
    //  return S3Example();
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
