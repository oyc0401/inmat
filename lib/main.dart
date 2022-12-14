import 'package:flutter/material.dart';
import 'package:inmat/auth_check.dart';

import 'package:inmat/inmat/auth/inmat_auth.dart';

void main() async {
  //////
  // DB에서 유저 정보 가져오기
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await InMatAuth.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Maps Demo',
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: child!,
      ),
      theme: ThemeData(
        fontFamily: 'Binggrae2',
        useMaterial3: true,
      ),
      home: const AuthCheck(),
    );
  }
}
