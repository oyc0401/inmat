part of '../inmat_api.dart';

class UtilsApi {
  ///로그인 API
  Future<String> getImageUrl(String fileName,String token) async {
    InMatHttp http = InMatHttp(
      Http.post,
      message: "s3 서명된 url 얻기",
      url: "/utils/images",
      body: {
        "fileName": fileName,
      },
      token: token,
    );
    return await http.execute();
  }
}
