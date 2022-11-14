import 'package:restaurant/inmat/inMatHttp.dart';

class InMatProfile{

  Future<Map<String,dynamic>> getProfile({required String token}) async {
    InMatHttp inMatHttp = InMatHttp();
    Map response = await inMatHttp.publicGet(
        url: "http://prod.sogogi.shop:9000/users/profiles",token: token );

    if (response['isSuccess'] == false) {
      throw Exception(
          'Failed to load profile: ${response['code']}, ${response['message']}');
    }
    return response["result"];
  }
}