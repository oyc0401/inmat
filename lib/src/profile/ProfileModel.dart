import 'package:flutter/material.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';

class ProfileModel with ChangeNotifier {
  ProfileModel() {
    isUser = InMatAuth.instance.currentUser != null ? true : false;
    notifyListeners();
  }

  logout() {
    isUser = false;
    notifyListeners();
  }

  bool isUser = false;
}
