import 'package:currency/generated/l10n.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    var db = await openDatabase('time.db');
    try {
      await db.execute(
        'CREATE TABLE Record (id INTEGER PRIMARY KEY, name TEXT, icon TEXT, record_time TIMESTAMP, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
      );
    } catch (e) {
      e.toString();
    }
    try {
      await db.execute(
        'CREATE TABLE Record_Detail (id INTEGER PRIMARY KEY, record_id INTEGER, record_time TIMESTAMP, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
      );
    } catch (e) {
      e.toString();
    }
    try {
      await db.execute(
        'CREATE TABLE Emoji (id INTEGER PRIMARY KEY, name TEXT, icon TEXT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
      );
      final List<Map<String, Object>> emojiList = [
        {"name": S.current.custom_event, "icon": '✏️'},
        {"name": S.current.haircut, "icon": '✂️'},
        {"name": S.current.replace_razor, "icon": '🪒'}
      ];
      for (var emoji in emojiList) {
        String name = emoji['name'].toString();
        String icon = emoji['icon'].toString();
        await db.rawInsert(
          'INSERT INTO Emoji(name, icon) VALUES("$name", "$icon")',
        );
      }
    } catch (e) {
      e.toString();
    }
    try {
      await db.execute(
        'CREATE TABLE Rewarder (id INTEGER PRIMARY KEY, record_time TIMESTAMP, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
      );
    } catch (e) {
      e.toString();
    }
    return db;
  }
}
