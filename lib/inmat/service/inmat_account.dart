import 'package:inmat/inmat/inmat_api/inmat_api_library.dart';

class InMatAccount {

  static Future<bool> checkNickName({
    required String nickName,
  }) async {
    String message = await InmatApi.auth.checkNickName(nickName);
    return message == "닉네임 사용가능!";
  }

  static Future<bool> checkId({
    required String id,
  }) async {
    String message = await InmatApi.auth.checkId(id);
    return message == "아이디 사용가능!";
  }
}
