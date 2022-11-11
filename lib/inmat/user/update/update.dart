import '../../inMatHttp.dart';

class InMatUpdate {
  update(Map user) async {
    InMatHttp inMatHttp = InMatHttp();
    Map response = await inMatHttp.publicPost(
        url: "http://prod.sogogi.shop:9000/users/profile", body: user);

    if (response['isSuccess'] == false) {
      throw Exception(
          'Failed to load sign in: ${response['code']}, ${response['message']}');
    }
  }
}
