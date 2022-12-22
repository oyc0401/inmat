import 'inmat_http.dart';

class InMatUpdate extends InMatHttp {
  update(String token, Map user) async {
    print("프로필 업데이트 중...");
    Map response = await publicPatch(
        url: "http://prod.sogogi.shop:9000/users/profiles",
        body: user,
        token: token);

    if (response['isSuccess'] == false) {
      print("프로필 업데이트 실패!");

      if (response['code'] == 401) {
        throw ExpirationAccessToken();
      } else if (response['code'] == 403) {
        throw AccessDenied();
      } else if (response['code'] == 3035) {
        throw OverlappingNickName();
      }

      throw Exception(
          'Failed to load update profile: ${response['code']}, ${response['message']}');
    }
    print("프로필 업데이트 성공!");
  }
}
