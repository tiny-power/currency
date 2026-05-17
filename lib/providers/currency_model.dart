import 'package:currency/database_helper.dart';
import 'package:flutter/foundation.dart';

class CurrencyModel extends ChangeNotifier {
  List<Map> _list = [];

  List<Map> get list => _list;

  void queryData() async {
    final db = await DatabaseHelper().database;
    try {
      var listData = await db.rawQuery('SELECT * FROM Currency');
      _list = listData.toList();
    } catch (e) {
      e.toString();
    }
    notifyListeners();
  }
}
