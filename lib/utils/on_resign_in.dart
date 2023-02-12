import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/src/account/login_main/signin_page.dart';
import 'package:inmat/utils/navigator_context.dart';

import 'toast.dart';

class OnReSignIn {
  static reSignIn([BuildContext? cococo]) {
    Message.showMessage("다시 로그인 해주세요.");
    InmatAuth.instance.resignIn();
    Navigator.pushAndRemoveUntil(
      NavigatorContext.context,
      CupertinoPageRoute(builder: (_) => const SignInMainPage()),
      (route) => false,
    );
  }


  static onError(dynamic error){
    Message.showMessage(error);
  }
}
