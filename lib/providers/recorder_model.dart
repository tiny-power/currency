import 'package:currency/database_helper.dart';
import 'package:flutter/foundation.dart';

class RecorderModel extends ChangeNotifier {
  List<Map> _list = [];

  List<Map> get list => _list;


  void queryData() async {
    final db = await DatabaseHelper().database;
    try {
      var listData = await db.rawQuery(
        'SELECT * FROM Record order by created_at desc',
      );
      _list = listData.toList();
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  void deleteById(int index, String id) async {
    _list.removeAt(index);
    final db = await DatabaseHelper().database;
    try {
      await db.rawDelete('delete from Record where id=$id');
      await db.rawDelete('delete from Record_Detail where record_id=$id');
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  void insert(
    String name,
    String codePoint
  ) async {
    final db = await DatabaseHelper().database;
    try {
      await db.rawInsert(
        'INSERT INTO Record(name, icon) VALUES("$name" , "$codePoint")',
      );
      var listData = await db.rawQuery(
        'SELECT * FROM Record order by created_at desc',
      );
      _list = listData.toList();
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }

  void update(
    int id,
    int recordTime
  ) async {
    final db = await DatabaseHelper().database;
    try {
      await db.rawUpdate( 'UPDATE Record SET record_time = $recordTime WHERE id = $id');
      await db.rawInsert(
        'INSERT INTO Record_Detail(record_id, record_time) VALUES($id , $recordTime)',
      );
      var listData = await db.rawQuery(
        'SELECT * FROM Record order by created_at desc',
      );
      _list = listData.toList();
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }
}
