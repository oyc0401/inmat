import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';

import 'package:inmat/inmat/service/inmat_account.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';
import 'package:inmat/utils/toast.dart';

class SignUpObject with ChangeNotifier {
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

  setUsername(String username) {
    _username = username;
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
}

class SignUpModel extends SignUpObject {
  ValidAccount validation = ValidAccount();
  bool _canID = false;
  bool _canNickName = false;

  String get number => "$phoneNumber1-$phoneNumber2-$phoneNumber3";

  // 유효성 검사
  bool get validUsername => validation.userName(username);

  bool get validPassword => validation.password(password);

  bool get validEmail => validation.email(email);

  bool get validNickName => validation.nickName(nickName);

  bool get validPhoneNumber => validation.phoneNumber(number);

  /// 비밀번호
  bool get correctPassword => password == rePassword;

  bool get canId => _canID;

  bool get canNickName => _canNickName;

  bool get canSignUp {
    // print("canSignUp");
    // print(validUsername);
    // print(validPassword);
    // print(validEmail);
    // print(validNickName);
    // print(validPhoneNumber);
    // print(correctPassword);
    // print(canId);
    // print(canNickName);

    return validUsername &&
        validPassword &&
        validEmail &&
        validNickName &&
        validPhoneNumber &&
        correctPassword &&
        canId &&
        canNickName;
  }

  @override
  setUsername(String username) {
    _canID = false;
    super.setUsername(username);
  }

  @override
  setNickName(String nickName) {
    _canNickName = false;
    super.setNickName(nickName);
  }

  checkID() async {
    if (!validUsername) {
      Message.showMessage("잘못된 아이디 형식 입니다. 영문 or 숫자 3 ~ 10 자");
    } else {
      try {
        _canID = await InMatAccount.checkId(id: username);
      } on OverlappingAccount {
        Message.showMessage("사용중인 아이디 입니다.");
      } catch (e) {
        Message.showMessage("$e");
      }
    }

    notifyListeners();
  }

  checkNickName() async {
    if (!validNickName) {
      Message.showMessage("잘못된 닉네임 형식 입니다. 한글 2자 ~ 8자");
    } else {
      try {
        _canNickName = await InMatAccount.checkNickName(nickName: nickName);
      } on OverlappingNickName {
        Message.showMessage("사용중인 닉네임 입니다.");
      } catch (e) {
        Message.showMessage("$e");
      }
    }

    notifyListeners();
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
      await InmatApi.auth.registerEmail(
        id: username,
        password: password,
        email: email,
        age: int.parse(age),
        gender: gender,
        nickName: nickName,
        phoneNumber: "$phoneNumber1-$phoneNumber2-$phoneNumber3",
      );


      Message.showMessage('회원가입 성공');
    } on OverlappingAccount {
      // 아이디 중복 메세지 띄우기
      Message.showMessage('아이디 중복');
      _canID = false;
    } on OverlappingNickName {
      // 닉네임 중복 메세지 띄우기
      _canNickName = false;
      Message.showMessage('닉네임 중복');
    } catch (e) {
      // 오류 메세지 띄우기
      print(e);
      Message.showMessage('$e');
    } finally {
      notifyListeners();
    }
  }
}

class ValidAccount {
  bool password(String password) {
    bool match = RegExp(
            r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,20}$")
        .hasMatch(password);
    return match;
  }

  bool email(String email) {
    bool match = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-z]+$").hasMatch(email);
    return match;
  }

  bool nickName(String nickName) {
    bool match = RegExp(r"[가-힣]{2,8}").hasMatch(nickName);
    return match;
  }

  bool phoneNumber(String number) {
    bool match = RegExp(r"^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$")
        .hasMatch(number);
    return match;
  }

  bool userName(String username) {
    bool match = RegExp(r"[a-zA-Z0-9]{3,10}").hasMatch(username);
    return match;
  }
}
