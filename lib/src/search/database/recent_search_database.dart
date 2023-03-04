import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/recent_model.dart';

class RecentDataBase {
  RecentDataBase._();

  late Database database;

  static Future<RecentDataBase> get instance async {
    RecentDataBase recentDataBase = RecentDataBase._();
    recentDataBase.database = await openDatabase(
      // 데이터베이스 경로를 지정합니다. 참고: `path` 패키지의 `join` 함수를 사용하는 것이
      // 각 플랫폼 별로 경로가 제대로 생성됐는지 보장할 수 있는 가장 좋은 방법입니다.
      join(await getDatabasesPath(), 'recent_search_database.db'),
      // 데이터베이스가 처음 생성될 때, dog를 저장하기 위한 테이블을 생성합니다.
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE recents(id TEXT PRIMARY KEY, word TEXT, date TEXT)",
        );
      },
      // 버전을 설정하세요. onCreate 함수에서 수행되며 데이터베이스 업그레이드와 다운그레이드를
      // 수행하기 위한 경로를 제공합니다.
      version: 1,
    );

    return recentDataBase;
  }

  Future<void> insertRecent(RecentModel recent) async {
    await database.insert(
      'recents',
      recent.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<RecentModel>> recents() async {
    final List<Map<String, dynamic>> maps = await database.query(
      'recents',
      orderBy: "date DESC",
    );
    return List.generate(maps.length, (i) {
      return RecentModel(
        id: maps[i]['id'],
        word: maps[i]['word'],
        date: maps[i]['date'],
      );
    });
  }

  Future<void> updateDog(RecentModel recent) async {
    await database.update(
      'recents',
      recent.toMap(),
      // Dog의 id가 일치하는 지 확인합니다.
      where: "id = ?",
      // Dog의 id를 whereArg로 넘겨 SQL injection을 방지합니다.
      whereArgs: [recent.id],
    );
  }

  Future<void> deleteDog(String id) async {
    // 데이터베이스에서 Dog를 삭제합니다.
    await database.delete(
      'recents',
      // 특정 dog를 제거하기 위해 `where` 절을 사용하세요
      where: "id = ?",
      // Dog의 id를 where의 인자로 넘겨 SQL injection을 방지합니다.
      whereArgs: [id],
    );
  }
}

