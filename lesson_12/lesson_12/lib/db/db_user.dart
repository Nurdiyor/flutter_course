import 'package:lesson_12/models/user_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperUser {
  DatabaseHelperUser._();

  static const DATABASE_NAME = "user_db.db";
  static final DatabaseHelperUser instance = DatabaseHelperUser._();
  static Database _database;

  Future<Database> get database async {
    if (_database == null) {
      return await initializeDatabase();
    }
    return _database;
  }

  initializeDatabase() async {
    return await openDatabase(join(await getDatabasesPath(), DATABASE_NAME),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE ${User.TABLE_NAME}(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,name TEXT, number TEXT)");
    });
  }

  //insert
  Future<int> insertUser(User user) async {
    final db = await database;
    var res = db.insert(User.TABLE_NAME, user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

//select
  Future<List<User>> getAllUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(User.TABLE_NAME);
    return List.generate(maps.length, (index) {
      return User(
        id: maps[index]["id"],
        name: maps[index]["name"],
        number: maps[index]["number"],
      );
    });
  }

  Future<int> updateUser(User user) async {
    final db = await database;
    return db.update(User.TABLE_NAME, user.toJson(),
        where: 'id = ?',
        conflictAlgorithm: ConflictAlgorithm.replace,
        whereArgs: [user.id]);
  }

  Future<int> deleteUser(int id) async {
    final db = await database;
    return db.delete(User.TABLE_NAME, where: 'id = ?', whereArgs: [id]);
  }

}
