// part of 'inmat_library.dart';

import 'inmat_data.dart';
import 'inmat_local.dart';
import 'inmat_local_interface.dart';

class Inmat {
  Inmat._();

  static InmatData? _delegateData;

  static InmatLocal local = InmatLocal();

  static InmatData get user {
    return _delegateData ??= InmatData(local);
  }

  static Future<void> initializeApp() async {
    await local.initialize();
    await user.initialize();
  }
}
