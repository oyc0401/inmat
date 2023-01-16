import 'package:flutter/material.dart';
import 'package:inmat/inmat/inmat_api/inmat_api.dart';
import 'package:inmat/src/search/domain/database/recent_search_database.dart';

import '../domain/models/rank.dart';
import '../domain/models/recent_model.dart';

class SearchModel with ChangeNotifier {
  SearchModel() {
    setRanks();
    setRecents();
  }

  bool successRank = false;
  bool successRecent = false;

  final List<Rank> _rank = [];

  List<RecentModel> _recents = [];

  List<Rank> get posts => _rank;

  List<RecentModel> get recents => _recents;

  Future<void> setRanks() async {
    List<Map> maps = await InMatApi.restaurant.getSearchRank();

    for (var map in maps) {
      _rank.add(Rank(map['ranking'], map['word']));
    }
    successRank = true;
    notifyListeners();
  }

  Future<void> setRecents() async {
    RecentDataBase dataBase = await RecentDataBase.instance;
    _recents = await dataBase.recents();

    successRecent = true;
    notifyListeners();
  }

  Future<void> addRecents(String word) async {
    DateTime now = DateTime.now();
    RecentModel model = RecentModel(id: word, word: word, date: now.toString());

    //DB 접근
    RecentDataBase dataBase = await RecentDataBase.instance;
    dataBase.insertRecent(model);

    // 배열에 추가
    recents.removeWhere((element) => element.id == word);
    recents.insert(0, model);

    notifyListeners();
  }

  Future<void> deleteRecents(String word) async {
    //DB 접근
    RecentDataBase dataBase = await RecentDataBase.instance;
    dataBase.deleteDog(word);

    // 배열에서 삭제
    recents.removeWhere((element) => element.id == word);
    notifyListeners();
  }
}
