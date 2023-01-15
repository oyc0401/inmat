import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

import '../models/rank.dart';

class SearchModel with ChangeNotifier {
  SearchModel() {
    init();
  }

  bool success = false;
  final List<Rank> _rank = [];
  bool isText = false;

  List<Rank> get posts => _rank;

  init() async {
    List<Map> maps = await InMatApi.restaurant.getSearchRank();

    for (var map in maps) {
      _rank.add(Rank(map['ranking'], map['word']));
    }
    success = true;
    notifyListeners();
  }
}
