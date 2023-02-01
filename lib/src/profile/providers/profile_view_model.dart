import 'package:flutter/material.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';

class ProfileViewModel with ChangeNotifier {
  ProfileViewModel() {
    isUser = InMatAuth.instance.currentUser != null ? true : false;
    notifyListeners();
  }

  logout() {
    isUser = false;
    notifyListeners();
  }

  bool isUser = false;
}
