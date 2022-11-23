import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:restaurant/inmat/auth/inmat_account.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';

void showMessage(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      textColor: Colors.white,
      fontSize: 16.0);
}

class SignUpForm with ChangeNotifier {
  String _username = "";
  String _password = "";
  String _rePassword = "";
  String _email = "";
  String _age = '0';
  String _gender = "";
  String _nickName = "";
  String _phoneNumber1 = "";
  String _phoneNumber2 = "";
  String _phoneNumber3 = "";

  String get username => _username;

  String get password => _password;

  String get rePassword => _rePassword;

  String get email => _email;

  String get age => _age;

  String get gender => _gender;

  String get nickName => _nickName;

  String get phoneNumber1 => _phoneNumber1;

  String get phoneNumber2 => _phoneNumber2;

  String get phoneNumber3 => _phoneNumber3;

  bool _canID = false;
  bool _canNickName = false;

  setUsername(String username) {
    _username = username;
    _canID = false;
    notifyListeners();
  }

  setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  setRePassword(String password) {
    _rePassword = password;
    notifyListeners();
  }

  setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  setAge(String age) {
    _age = age;
    notifyListeners();
  }

  setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  setNickName(String nickName) {
    _nickName = nickName;
    _canNickName = false;
    notifyListeners();
  }

  setPhoneNumber1(String number) {
    _phoneNumber1 = number;
    notifyListeners();
  }

  setPhoneNumber2(String number) {
    _phoneNumber2 = number;
    notifyListeners();
  }

  setPhoneNumber3(String number) {
    _phoneNumber3 = number;
    notifyListeners();
  }

  checkID(){

  }

  checkNickName(){

  }

  bool correctPassword() {
    return password == rePassword;
  }

  bool canSignUp() {
    return correctPassword();
  }

  Future<void> signup() async {
    print(username);
    print(password);
    print(email);
    print(age);
    print(gender);
    print(nickName);
    print(phoneNumber1);
    print(phoneNumber2);
    print(phoneNumber3);

    try {
      await InMatAccount.registerEmail(
        id: username,
        password: password,
        profile: Profile(
            email: email,
            age: int.parse(age),
            gender: gender,
            nickName: nickName,
            phoneNumber: "$phoneNumber1-$phoneNumber2-$phoneNumber3"),
      );
      showMessage('회원가입 성공');
    } on OverlappingAccount {
      // 아이디 중복 메세지 띄우기
      showMessage('아이디 중복');
    } on OverlappingNickName {
      // 닉네임 중복 메세지 띄우기
      showMessage('닉네임 중복');
    } catch (e) {
      // 오류 메세지 띄우기
      print(e);
      showMessage('$e');
    }
  }
}
