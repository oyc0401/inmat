
import 'inmat_data.dart';

class Inmat {
  Inmat._();

  static InmatData? _delegatePackingProperty;

  static InmatData get user {
    return _delegatePackingProperty ??= InmatData();
  }

  static set user(InmatData platform) {
    _delegatePackingProperty = platform;
  }

  static Future<void> initializeApp() async {
    await user.initialize();
  }
}
