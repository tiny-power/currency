import 'package:currency/database_helper.dart';
import 'package:flutter/foundation.dart';

class EmojiModel extends ChangeNotifier {
  List<Map> _list = [];

  List<Map> get list => _list;

  void queryData() async {
    final db = await DatabaseHelper().database;
    try {
      var listData = await db.rawQuery(
        'SELECT * FROM Emoji order by created_at',
      );
      _list = listData.toList();
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  void deleteById(int id) async {
    final db = await DatabaseHelper().database;
    try {
      await db.rawDelete('delete from Emoji where id=$id');
      var listData = await db.rawQuery(
        'SELECT * FROM Emoji order by created_at',
      );
      _list = listData.toList();
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  void insert(String name, String icon) async {
    final db = await DatabaseHelper().database;
    try {
      await db.rawInsert(
        'INSERT INTO Emoji(name, icon) VALUES("$name" , "$icon")',
      );
      var listData = await db.rawQuery(
        'SELECT * FROM Emoji order by created_at',
      );
      _list = listData.toList();
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  void update(int id, String name, String icon) async {
    final db = await DatabaseHelper().database;
    try {
      await db.rawUpdate(
        'UPDATE Emoji SET name = "$name", icon = "$icon" WHERE id = $id',
      );
      var listData = await db.rawQuery(
        'SELECT * FROM Emoji order by created_at',
      );
      _list = listData.toList();
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  Future<Map<dynamic, dynamic>> selectById(int id) async {
    final db = await DatabaseHelper().database;
    try {
      List<Map> list = await db.rawQuery('SELECT * FROM Emoji WHERE id = $id');
      return list[0];
    } catch (e) {
      e.toString();
      return {};
    }
  }
}
