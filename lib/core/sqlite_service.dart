import 'package:booking/features/home/models/favorites.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';

class DatabaseHelper {
  static Database? _database;
  static const String tableName = 'favorites';

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'favorites.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            title TEXT,
            metroName TEXT,
            time TEXT,
            hotelId INTEGER,
            price INTEGER,
            priceText TEXT,
            ocklock TEXT,
            phone TEXT
          )
        ''');
      },
    );
  }

  Future<void> addFavorite(Favorite hotel) async {
    final db = await database;
    await db.insert(tableName, hotel.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteFavorite(int hotelId) async {
    final db = await database;
    await db.delete(
      tableName,
      where: 'hotelId = ?',
      whereArgs: [hotelId],
    );
  }

  Future<bool> isFavoriteById(int hotelId) async {
    final db = await database;
    final result = await db.query(
      tableName,
      where: 'hotelId = ?',
      whereArgs: [hotelId],
    );
    return result.isNotEmpty;
  }

  Future<List<Favorite>> getFavorites() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(tableName);
    return List.generate(maps.length, (i) {
      return Favorite(
        id: maps[i]['id'],
        image: maps[i]['image'],
        title: maps[i]['title'],
        metroName: maps[i]['metroName'],
        time: maps[i]['time'],
        hotelId: maps[i]['hotelId'],
        price: maps[i]['price'],
        priceText: maps[i]['priceText'],
        ocklock: maps[i]['ocklock'],
        phone: maps[i]['phone'],
      );
    });
  }
}
