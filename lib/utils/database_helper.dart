import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class DatabaseHelper {
  static Database? _database;
  static DatabaseHelper? _databaseHelper = DatabaseHelper._internal();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper!;
    } else {
      return _databaseHelper!;
    }
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initializeDatabase();
      return _database!;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "notlar.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "notlar.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    return await openDatabase(path, readOnly: false);
  }

  kategorileriGetir() async {
    var db = await _getDatabase();
    var sonuc = await db.query("kategori");
    print(sonuc);
    /* BURASI EKLEME İÇİN BİR ÖRNEK
    var ekleme =
        await db.insert("kategori", {'kategoriBaslik': 'Test Kategorisi'});
    var sonuc2 = await db.query("kategori");
    */
  }
}
