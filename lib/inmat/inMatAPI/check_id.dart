import 'inmat_http.dart';

class InMatCheckId extends InMatHttp {
  Future<bool> check({required String username}) async {
    print("아이디 중복 체크 중...");

    Map body = {'username': username};

    Map response = await publicPost(
        url: "http://prod.sogogi.shop:9000/users/username", body: body);

    if (response['isSuccess'] == false) {
      print("아이디 중복 체크 실패!");
      if (response['code'] == 3030) {
       return false;
      }
      throw Exception(
          'Failed to check username: ${response['code']}, ${response['message']}');
    }
    print("아이디 중복 체크 성공!");
    return true;
  }
}

void main() {}
