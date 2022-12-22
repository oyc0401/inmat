import '../inmat_http.dart';

class InMatCheckNickName extends InMatHttp {
  Future<bool> check({required String nickName}) async {
    print("닉네임 중복 체크 중...");

    Map body = {'nickName': nickName};

    Map response = await publicPost(
        url: "http://prod.sogogi.shop:9000/users/nickname", body: body);

    if (response['isSuccess'] == false) {
      print("닉네임 중복 체크 실패!");
      if (response['code'] == 3035) {
       return false;
      }
      throw Exception(
          'Failed to check nickName: ${response['code']}, ${response['message']}');
    }
    print("닉네임 중복 체크 성공!");
    return true;
  }
}

void main() {}
