import 'inMatHttp.dart';

class InMatRegister extends InMatHttp{
  Future<void> registerEmail({required Map user}) async {
    print("회원가입 하는 중...");
    Map response = await publicPost(
        url: "http://prod.sogogi.shop:9000/users/signup", body: user);

    if (response['isSuccess'] == false) {
      print("회원가입 실패!");

      if (response['code'] == 3030) {
        throw OverlappingAccount();
      } else if (response['code'] == 3035) {
        throw OverlappingNickName();
      }

      throw Exception(
          'Failed to load sign in: ${response['code']}, ${response['message']}');
    }
    print("회원가입 성공!");
    return;
  }
}



// 12 20