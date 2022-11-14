import 'inMatHttp.dart';

class InMatUpdate extends InMatHttp{
  update(Map user) async {
    print("프로필 업데이트 중...");
    Map response = await publicPost(
        url: "http://prod.sogogi.shop:9000/users/profile", body: user);


    if (response['isSuccess'] == false) {
      print("프로필 업데이트 실패!");
      throw Exception(
          'Failed to load sign in: ${response['code']}, ${response['message']}');
    }
    print("프로필 업데이트 성공!");
  }
}
