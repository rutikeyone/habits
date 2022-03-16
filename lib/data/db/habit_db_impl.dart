import 'package:flutter/rendering.dart';
import 'package:habits/data/db/habit_db.dart';
import 'package:habits/data/mapper/habit_mapper.dart';
import 'package:habits/data/model/habit_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabaseImpl implements HabitDatabase {
  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();
  static final HabitDatabaseImpl instance =
      HabitDatabaseImpl._privateConstructor();
  HabitDatabaseImpl._privateConstructor();

  Future<Database> _initDatabase() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, 'habits.db');
    return openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    return await db.execute('''
      CREATE TABLE habits (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        unselectedColorValue INTEGER NOT NULL,
        selectedColorValue INTEGER NOT NULL,
        timesAWeek TEXT,
        weekDaysName TEXT,
        daysMilliSeconds TEXT,
        selectedDaysMilliSeconds TEXT,
        completedDaysMilliSeconds TEXT,
        notice TEXT
      )
      ''');
  }

  @override
  Future<List<HabitModel>> getHabits() async {
    final db = await instance.database;
    final habitsQuery = await db.query('habits');

    List<HabitModel> habits = habitsQuery.isNotEmpty
        ? habitsQuery.map((e) => HabitModel.fromMap(e)).toList()
        : [];

    return habits;
  }

  @override
  Future<int> add(HabitModel habit) async {
    final db = await instance.database;
    return db.insert('habits', habit.toMap());
  }

  @override
  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('habits', where: 'id = ?', whereArgs: [id]);
  }

  @override
  Future<int> update(HabitModel habit) async {
    final db = await instance.database;

    return await db.update('habits', habit.toMap(),
        where: 'id = ?', whereArgs: [habit.id]);
  }
}
