import '../inmat.dart';
import '../models/token_model.dart';
import '../exception/inmat_exception.dart';
import 'inmat_http.dart';

class InmatTokenHttp extends InMatHttp {
  InmatTokenHttp(
    super.how, {
    required super.path,
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

      Token token = await Inmat.local.getValidToken();
      super.token = token.accessToken;
      super.refreshToken = token.refreshToken;
      super.deviceIdentifier = Inmat.local.deviceIdentifier;

      return super.execute();
    });
  }
}
