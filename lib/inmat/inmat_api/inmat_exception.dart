class ExpirationAccessToken implements Exception {
  @override
  String toString() => "액세스 토큰이 만료되었습니다.";
}

class SignInFailed implements Exception {
  @override
  String toString() => "없는 아이디이거나 비밀번호가 틀렸습니다.";
}

class AccessDenied implements Exception {
  @override
  String toString() => "접근에 권한이 없습니다.";
}

class OverlappingAccount implements Exception {
  @override
  String toString() => "중복된 아이디입니다.";
}

class OverlappingNickName implements Exception {
  @override
  String toString() => "중복된 닉네임 입니다.";
}

class Invalidate implements Exception {
  @override
  String toString() => "입력값을 확인해주세요.";
}

class DataBaseFailed implements Exception {
  @override
  String toString() => "데이터베이스 연결에 실패하였습니다";
}
