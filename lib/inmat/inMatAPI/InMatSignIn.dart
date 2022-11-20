import 'inMatHttp.dart';

class InMatSignIn extends InMatHttp {
  Future<Map<String,dynamic>> emailSignIn({required Map user}) async {
    print("이메일 로그인 중...");
    Map response = await publicPost(
        url: "http://prod.sogogi.shop:9000/users/login", body: user);

    if (response['isSuccess'] == false) {
      print("이메일 로그인 실패!");
      if (response['code'] == 3010) {
        throw SignInFailed();
      }
      throw Exception(
          'Failed to load sign in: ${response['code']}, ${response['message']}');
    }

    Map<String,dynamic> token = response['result'];
    print("이메일 로그인 성공!");
    return token;
  }
}

void main() {}
