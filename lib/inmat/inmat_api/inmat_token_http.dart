import '../inmat.dart';
import '../inmat_local.dart';
import '../models/token_model.dart';
import 'inmat_exception.dart';
import 'inmat_http.dart';

class InmatTokenHttp extends InMatHttp {
  InmatTokenHttp(
    super.how, {
    required super.url,
    required super.message,
    super.body,
  });

  static dynamic doubleCheckToken(Function api) async {
    try {
      return await api();
    } on ExpirationAccessToken {
      return await api();
    }
  }

  @override
  dynamic execute() async {
    return await doubleCheckToken(() async {
      InmatLocal local = Inmat.local;
      Token token = await local.getValidToken();
      super.token = token.accessToken;
      super.refreshToken = token.refreshToken;
      super.deviceIdentifier = local.deviceIdentifier;

      return super.execute();
    });
  }
}
