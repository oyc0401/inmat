import 'package:inmat/inmat/exception/inmat_exception.dart';

class InmatApiException<T> {
  InmatApiException(this.callBack);

  Function callBack;
  dynamic exception;

  Function? onRefreshDeniedFunction;
  Function(dynamic error)? onErrorFunction;

  Future<Type?> execute(Function(T value) function) async {
    try {
      T value = await callBack();
      function(value);
      return T;
    } on ExpirationRefreshToken {
      if (onRefreshDeniedFunction != null) {
        onRefreshDeniedFunction!();
      }else{
        throw "오류를 캐치해주세요";
      }
    } catch (e) {
      if (onErrorFunction != null) {
        onErrorFunction!(e);
      }else{
        throw "오류를 캐치해주세요";
      }
    }
    return null;

  }

  InmatApiException onRefreshDenied(Function function) {
    onRefreshDeniedFunction = function;
    // if (refreshDenied) function();
    return this;
  }

  InmatApiException onError(Function(dynamic error) function) {
    onErrorFunction = function;
    // if (isError) function(exception);
    return this;
  }
}

void main() async {
  Future<String> longFunction() async {
    await Future.delayed(Duration(seconds: 1));
    // throw "SDadas";
    return "value";
  }

  InmatApiException<String> apiException = InmatApiException(() async {
    print("api 실행");
    throw "SDadas";
    // return await longFunction();
  });

  apiException.onRefreshDenied(() {
    print("onRefreshDenied");
  }).onError((e) {
    print("onError: $e");
  }).execute((v) {
    print("then: $v");
  });
}
