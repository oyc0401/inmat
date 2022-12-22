import 'package:flutter/cupertino.dart';
import 'package:restaurant/inmat/auth/inmat_auth.dart';
import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';

class ChangeProfileModel with ChangeNotifier {
  ChangeProfileModel() {
    profile = InMatAuth.instance.currentUser!.toMap();
  }

  Map<String, dynamic> profile = {};

  String nickname ='';

  void setNickname(name) {
    nickname = name;
    notifyListeners();
  }

  Future<void> change() async {
    profile['nickName'] = nickname;
    print(profile);

    try {
      await InMatAuth.instance.updateProfile(profile);
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
