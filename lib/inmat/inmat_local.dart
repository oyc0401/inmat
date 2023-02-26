import 'package:inmat/inmat/service/mobile_id.dart';
import 'package:jwt_decode/jwt_decode.dart';

import 'service/token_database_controller.dart';

import 'inmat_local_interface.dart';
import 'models/token_model.dart';
import 'service/get_token.dart';

class InmatLocal implements InmatLocalInterface {
  InmatLocal();

  TokenDataBase dataBase = TokenDataBase();

  Token? _token;

  String _deviceIdentifier = "";

  @override
  Token? get currentToken => _token;

  @override
  String get deviceIdentifier => _deviceIdentifier;

  @override
  bool get tokenIsEmpty => _token == null;

  @override
  void clearToken() {
    _token = null;
    dataBase.delete();
  }

  @override
  void saveToken(Token? model) {
    _token = model;
    if (model != null) {
      dataBase.saveLocalToken(model);
    } else {
      dataBase.delete();
    }
  }

  @override
  void saveTokenMemory(Token? model) {
    _token = model;
  }

  Future<void> _regenerateToken() async {
    assert(_token != null);
    Token newToken = await GetToken.issueToken(_token!, _deviceIdentifier);
    saveToken(newToken);
    dataBase.saveLocalToken(newToken);
  }

  bool _isValid() {
    if (_token == null) {
      throw Exception("unhandled http error: 토큰이 없어요!");
    }
    DateTime? expiryDate = Jwt.getExpiryDate(_token!.accessToken);

    if (expiryDate == null) {
      throw Exception("토큰이 이상해요!");
    }

    DateTime now = DateTime.now();

    Duration difference = expiryDate.difference(now);

    return !difference.isNegative;
  }

  @override
  Future<Token> getValidToken() async {
    assert(_token != null);
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
    saveToken(localToken);
  }
}
