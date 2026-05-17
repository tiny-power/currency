import 'dart:convert';

import 'package:flutter/services.dart';
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
    var db = await openDatabase('currency.db');
    final commandContent = await rootBundle.loadString(
      'assets/currency.json',
    );
    final List<dynamic> jsonList = jsonDecode(commandContent);
    try {
      await db.execute(
        'CREATE TABLE Currency (id INTEGER PRIMARY KEY, name TEXT, desc TEXT)',
      );
      var batch = db.batch();
      for (var item in jsonList) {
        batch.insert('Currency', item);
      }
      await batch.commit(noResult: true);
    } catch (e) {
      e.toString();
    }
    try {
      await db.execute(
        'CREATE TABLE Record (id INTEGER PRIMARY KEY, name TEXT, icon TEXT, record_time TIMESTAMP, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)',
      );
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
