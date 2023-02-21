import 'package:flutter/material.dart';

import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';
import 'package:inmat/utils/toast.dart';

import '../../navigator/NavigatePage.dart';


class EmailSignInModel with ChangeNotifier {
  String _username = "test123";
  String _password = "qwe12345&&";

  String get username => _username;

  String get password => _password;

  setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  signIn(BuildContext context) async {
    print('id      : $username');
    print('password: $password');
    //"test123", "qwe12345&&");

    try {
      await InmatAuth.instance.signInEmail(username, password);
      Message.showMessage('로그인 성공: $username, $password');

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => NavigatePage()),
            (route) => false,
      );
    } on SignInFailed {
      // 로그인 실패 메세지 띄우기
      Message.showMessage('없는 아이디이거나 비밀번호가 틀렸습니다.\n$username, $password');
    } catch (e) {
      // 오류 메세지 띄우기
      print(e);
      Message.showMessage('$e');
    }
  }
}
