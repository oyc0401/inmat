import 'package:jwt_decode/jwt_decode.dart';

import '../utils/mobile_id.dart';
import 'auth/domain/service/database_handler.dart';

import 'inmat_api_core.dart';
import 'inmat_local_interface.dart';
import 'models/token_model.dart';

class InmatLocal implements InmatLocalInterface {
  InmatLocal();

  TokenDataBase dataBase = TokenDataBase();

  Token? _token;

  Token? get currentToken => _token;

  late String _deviceIdentifier;

  String get deviceIdentifier => _deviceIdentifier;

  @override
  void clearToken() {
    _token = null;
    dataBase.delete();
  }

  @override
  bool tokenIsEmpty() {
    return _token == null;
  }

  void setToken(Token? model) {
    _token = model;
  }

  Future<void> _regenerateToken() async {
    assert(_token != null);
    Token newToken = await InmatCoreApi.issueToken(_token!, _deviceIdentifier);
    setToken(newToken);
    dataBase.saveLocalToken(newToken);
  }

  bool _isValid() {
    if (_token == null) {
      throw Exception("unhandled http error: 토큰이 없어요!");
    }
    DateTime? expiryDate = Jwt.getExpiryDate(_token!.accessToken);

    // print(expiryDate);
    if (expiryDate == null) {
      throw Exception("토큰이 이상해요!");
    }

    DateTime now = DateTime.now();

    Duration difference = expiryDate.difference(now);

    print(difference);
    return true;

    return !difference.isNegative;
  }

  Future<Token> getValidToken() async {
    bool valid = _isValid();

    if (!valid) {
      await _regenerateToken();
    }

    return _token!;
  }

  @override
  Future<void> initialize() async {
    return await _init();
  }

  Future<void> _init() async {
    _deviceIdentifier = await MobileId.getMobileId();
    Token? localToken = await dataBase.getLocalToken();
    setToken(localToken);
  }
}
