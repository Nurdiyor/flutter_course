import 'dart:io';

import 'package:flutter/services.dart';
import 'package:lesson_13/models/words.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseWord {
  DatabaseWord._();

  static const databaseName = 'words.db';
  static const databaseVersion = 1;

  //Constructor
  DatabaseWord._privateConstructor();

  static final DatabaseWord instance = DatabaseWord._privateConstructor();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initializeDatabase();
    return _database;
  }

  initializeDatabase() async {
    var databasePath = await getDatabasesPath();
    String path = join(databasePath, databaseName);
    var exists = await databaseExists(path);

    if (!exists) {
      print("Copy database to storage");
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (ex) {
        print(ex);
      }
      //copy
      ByteData data = await rootBundle.load(join("assets", databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      //write
      await File(path).writeAsBytes(bytes, flush: true);

      return await openDatabase(
        path,
        version: databaseVersion,
      );
    } else {
      print("opening existing db");
      return await openDatabase(
        path,
        version: databaseVersion,
      );
    }
  }

//insert
  Future<int> insertUser(Words words) async {
    final db = await database;
    var res = db.insert(Words.tableName, words.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

//select
  Future<List<Words>> getWords(String query) async {
    try {
      final db = await database;
      final List<Map<String, dynamic>> maps = await db.query(Words.tableName,
          where: 'word like ?', whereArgs: ['${query}%']);
      print("Boshlandi");
      print(maps);
      return List.generate(maps.length, (i) {
        print(maps[i]);
        return Words.fromJson(maps[i]);
      });
    } catch (ex) {
      print("Xatolik: ${ex}");
    }
  }

  Future<List<Words>> getFavouriteWords(String query) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "SELECT * FROM data WHERE favourite = 1 AND word LIKE ?",
        ['${query}%']);
    return List.generate(maps.length, (i) {
      print(maps[i]);
      return Words.fromJson(maps[i]);
    });
  }

//update
  Future<int> setFavourite(Words words) async {
    final db = await database;
    return db.update(Words.tableName, words.toJson(),
        where: 'id = ?',
        whereArgs: [words.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
//
////delete
//  Future<int> deleteUser(int id) async {
//    var db = await database;
//    return db.delete(User.TABLENAME, where: 'id = ?', whereArgs: [id]);
//  }
}
