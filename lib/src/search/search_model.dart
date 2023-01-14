import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';

class SearchModel with ChangeNotifier {
  SearchModel() {
    init();
  }

  bool success = false;
  final List<Rank> _rank = [];

  List<Rank> get posts => _rank;

  init() async {
    List<Map> maps = await InMatApi.restaurant.getSearchRank();

    maps.forEach((map) => _rank.add(Rank(map['rank'], map['word'])));
    success = true;
    notifyListeners();
  }
}

class Rank {
  Rank(this.rank, this.word);

  final int rank;
  final String word;
}
