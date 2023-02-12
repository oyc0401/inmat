import 'package:inmat/inmat/exception/inmat_exception.dart';
import 'package:inmat/utils/on_resign_in.dart';

class InmatCatchException<T> {
  InmatCatchException(this._callBack);

  Function _callBack;

  Function? _onRefreshDenied;
  Function? _onDatabaseFailed;
  Function(dynamic error)? _onError;

  Future<Type?> execute(Function(T value) function) async {
    try {
      T value = await _callBack();
      function(value);
      return T;
    } on ExpirationRefreshToken {
      if (_onRefreshDenied != null) {
        _onRefreshDenied!();
        return null;
      }
      rethrow;
    } on DataBaseFailed catch (e) {
      if (_onDatabaseFailed != null) {
        _onDatabaseFailed!();
        return null;
      } else {
        _onError!(e);
        return null;
      }
    } catch (e) {
      if (_onError != null) {
        _onError!(e);
        return null;
      }
      rethrow;
    }
  }

  InmatCatchException onRefreshDenied(Function() function) {
    _onRefreshDenied = function;
    return this;
  }

  InmatCatchException onDataBaseFailed(Function() function) {
    _onDatabaseFailed = function;
    return this;
  }

  InmatCatchException onError(Function(dynamic error) function) {
    _onError = function;
    return this;
  }

  factory InmatCatchException.basic(Function callback) {
    return InmatCatchException(callback)
      ..onRefreshDenied(() {
        OnReSignIn.reSignIn();
      })
      ..onError((error) {
        OnReSignIn.onError(error);
      });
  }
}

void main() async {
  Future<String> longFunction() async {
    await Future.delayed(Duration(seconds: 1));
    // throw "SDadas";
    return "value";
  }

  InmatCatchException<String> apiException = InmatCatchException(() async {
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
