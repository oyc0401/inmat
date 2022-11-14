
import 'inMatHttp.dart';

class InMatSignIn extends InMatHttp{
  Future<String> emailSignIn({required Map user}) async {
    print("이메일 로그인 중...");
    Map response = await publicPost(
        url: "http://prod.sogogi.shop:9000/users/login", body: user);

    if (response['isSuccess'] == false) {
      print("이메일 로그인 실패!");
      throw Exception(
          'Failed to load sign in: ${response['code']}, ${response['message']}');
    }
    String token=response['result']['token'];
    print("이메일 로그인 성공!");
    return token;
  }
}

void main() {}
