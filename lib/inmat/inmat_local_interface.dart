import 'models/token_model.dart';

class InmatLocalInterface {
  /// 토큰이 현재 비어있는지
  bool get tokenIsEmpty {
    throw UnimplementedError();
  }

  /// 토큰을 전역 변수와 데이터베이스에 저장한다.
  /// save token in global variable, database
  void saveToken(Token? model) {
    throw UnimplementedError();
  }

  /// 토큰을 전역 변수에만 저장한다.
  /// save token in global variable
  void saveTokenMemory(Token? model) {
    throw UnimplementedError();
  }

  /// 토큰을 전역 변수와 데이터베이스에서 삭제한다.
  /// clear token in global variable, database
  void clearToken() {
    throw UnimplementedError();
  }

  /// 현재 토큰을 준다.
  /// 토큰이 만료되었으면 새로 토큰을 발급해서 준다.
  /// 토큰이 현재 존재한다고 가정을 한다. 토큰이 비어있으면 오류가 발생한다.
  /// 토큰이 만료되지 않았어도 서버에 보내는 시간동안 만료될 수 있으니 주의해야한다.
  /// If token has been validated, issue new token
  Future<Token> getValidToken() async {
    throw UnimplementedError();
  }

  /// 데이터베이스에 있는 토큰을 전역변수로 꺼내오고,
  /// 현재 기기정보를 설정한다.
  /// Initializing token, device identifier
  Future<void> initialize() async {
    throw UnimplementedError();
  }

  /// 현재 기기정보
  /// Initialized device identifier
  String get deviceIdentifier {
    throw UnimplementedError();
  }

  /// 현재 토큰을 준다. 만료되었는지 알 수 없다.
  Token? get currentToken {
    throw UnimplementedError();
  }
}
