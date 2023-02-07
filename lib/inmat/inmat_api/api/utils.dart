part of '../inmat_api_library.dart';

class InmatUtilsApi {
  ///로그인 API
  Future<String> getImageUrl(String fileName) async {
    InmatTokenHttp http = InmatTokenHttp(
      Http.post,
      message: "s3 서명된 url 얻기",
      path: "/utils/images",
      body: {
        "fileName": fileName,
      },
    );
    return await http.execute();
  }
}
