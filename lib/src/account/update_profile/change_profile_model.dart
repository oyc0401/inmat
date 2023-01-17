import 'package:flutter/cupertino.dart';
import 'package:inmat/inmat/auth/inmat_auth.dart';
import 'package:inmat/inmat/inmat_api/inmat_exception.dart';

class ChangeProfileModel with ChangeNotifier {
  ChangeProfileModel() {
    age = InMatAuth.instance.currentUser!.age;
    nickName = InMatAuth.instance.currentUser!.nickName;
    gender = InMatAuth.instance.currentUser!.gender;
    profileImgUrl = InMatAuth.instance.currentUser!.profileImgUrl;
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
      await InMatAuth.instance.updateProfile(
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
