import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_generator/models/exercice_model.dart';
import 'package:workout_generator/models/user_progress.dart';
import 'package:workout_generator/models/categorie_model.dart';

class ExerciceService {
  Future<Database> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    final path = join(directory.path, "exercice.db");
    //databaseFactory.deleteDatabase(path);
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      db.execute(
        'CREATE TABLE Categorie(id INTEGER PRIMARY KEY, categorie_id INTEGER, name TEXT)',
      );
      db.execute(
        'CREATE TABLE Exercice(id INTEGER PRIMARY KEY, name TEXT,  categorie_id INTEGER)',
      );
      db.execute(
        'CREATE TABLE UserProgress(id INTEGER PRIMARY KEY, date TEXT, weight TEXT, repetition TEXT, exercice_id INTEGER)',
      );

      //Donnée par défaut
      addCategorie(CategorieModel(categorieId: 1, name: "Bicep"));
      addCategorie(CategorieModel(categorieId: 2, name: "Tricep"));
      addCategorie(CategorieModel(categorieId: 3, name: "Chest"));

      addExercice(ExerciceModel(categorieId: 1, name: "Bicep Curl"));
      addExercice(ExerciceModel(categorieId: 2, name: "Tricep Push Down"));
      addExercice(ExerciceModel(categorieId: 3, name: "Bench Press"));
    });
  }

  Future<int> addExercice(ExerciceModel exercice) async {
    final db = await init(); //open database
    return db.insert(
      "Exercice",
      exercice.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> addCategorie(CategorieModel categorie) async {
    final db = await init(); //open database
    return db.insert(
      "Categorie",
      categorie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<int> addUserProgress(UserProgressModel exercice) async {
    final db = await init(); //open database
    return db.insert(
      "UserProgress",
      exercice.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<ExerciceModel>> getExercice(int categorieId) async {
    final db = await init();
    final maps = await db.query("Exercice",
        where: "categorie_id = ?",
        whereArgs: [categorieId] // whereArgs to avoid SQL injection
        );

    return List.generate(maps.length, (i) {
      return ExerciceModel(
          id: maps[i]['id'] as int,
          categorieId: maps[i]['categorie_id'] as int,
          name: maps[i]['name'] as String);
    });
  }

  Future<List<CategorieModel>> getCategorie() async {
    final db = await init();
    final maps = await db.query("Categorie");

    return List.generate(maps.length, (i) {
      return CategorieModel(
          id: maps[i]['id'] as int,
          categorieId: maps[i]['categorie_id'] as int,
          name: maps[i]['name'] as String);
    });
  }

  Future<List<UserProgressModel>> getUserProgress(int exerciceId) async {
    final db = await init();
    final maps = await db.query("UserProgress",
        where: "exercice_id = ?",
        whereArgs: [exerciceId] // whereArgs to avoid SQL injection
        );

    return List.generate(maps.length, (i) {
      return UserProgressModel(
          id: maps[i]['id'] as int,
          exerciceId: maps[i]['exercice_id'] as int,
          date: maps[i]['date'] as String,
          weight: maps[i]['weight'] as String,
          repetition: maps[i]['repetition'] as String);
    });
  }

  Future<int> deleteUserProgress(int id) async {
    final db = await init();

    int result = await db.delete("UserProgress",
        where: "id = ?", whereArgs: [id] // whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateUserProgress(int id, UserProgressModel userProgress) async {
    final db = await init();

    int result = await db.update("UserProgress", userProgress.toMap(),
        where: "id = ?", whereArgs: [id]);
    return result;
  }
}
