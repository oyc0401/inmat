import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/exception/inmat_exception.dart';

class ChangeProfileModel with ChangeNotifier {
  ChangeProfileModel() {
    age = InmatAuth.instance.currentUser!.age;
    nickName = InmatAuth.instance.currentUser!.nickName;
    gender = InmatAuth.instance.currentUser!.gender;
    profileImgUrl = InmatAuth.instance.currentUser!.profileImgUrl;
    print(InmatAuth.instance.currentUser);
  }

  late int age;
  late String nickName;
  late String gender;
  late String? profileImgUrl;

  void setNickname(name) {
    nickName = name;
    notifyListeners();
  }

  Future<void> change() async {



    try {
      await InmatAuth.instance.updateProfile(
        age: age,
        gender: gender,
        nickName: nickName,
        profileImgUrl: profileImgUrl,
      );
    } on ExpirationAccessToken {
      // 액세스 토큰 만료: 로그아웃 후 다시 로그인
    } on AccessDenied {
      // 접근 권한 없음
    } on OverlappingNickName {
      // 닉네임 중복 알림
    } catch (e) {
      print(e);
      // 오류 메세지 알림
    }
  }
}
