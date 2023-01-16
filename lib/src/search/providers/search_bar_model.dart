import 'package:flutter/cupertino.dart';

class SearchBarModel with ChangeNotifier {
  String word = "";

  bool get isText => word != "";

  setWord(String text) {
    word = text;
    notifyListeners();
  }

}
