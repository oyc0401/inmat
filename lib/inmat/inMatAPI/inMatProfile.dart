import 'package:restaurant/inmat/inMatAPI/inMatHttp.dart';

class InMatProfile extends InMatHttp {
  Future<Map<String, dynamic>> getProfile({required String token}) async {
    print("프로필 불러오는 중...");

    Map response = await publicGet(
        url: "http://prod.sogogi.shop:9000/users/profiles", token: token);

    if (response['isSuccess'] == false) {
      print("프로필 불러오기 실패!");

      if (response['code'] == 401) {
        throw ExpirationAccessToken();
      } else if (response['code'] == 403) {
        throw AccessDenied();
      }

      throw Exception(
          'Failed to load profile: ${response['code']}, ${response['message']}');
    }
    print("프로필 불러오기 성공!");
    return response["result"];
  }
}
