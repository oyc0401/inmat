import '../../inMatHttp.dart';

class InMatRegister {
  Future<void> registerEmail({required Map user}) async {
    InMatHttp inMatHttp = InMatHttp();
    print(user);
    Map response = await inMatHttp.publicPost(
        url: "http://prod.sogogi.shop:9000/users/signup", body: user);

    if (response['isSuccess'] == false) {
      throw Exception(
          'Failed to load sign in: ${response['code']}, ${response['message']}');
    }
  }
}



// 12 20