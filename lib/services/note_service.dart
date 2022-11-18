import 'dart:async';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:workout_generator/models/note_model.dart';

class NoteService {
  Future<Database> init() async {
    Directory directory =
        await getApplicationDocumentsDirectory(); //returns a directory which stores permanent files
    final path = join(directory.path, "note.db"); //create path to database

    return await openDatabase(
        //open the database or create a database if there isn't any
        path,
        version: 1, onCreate: (Database db, int version) async {
      return db.execute(
        'CREATE TABLE note(id INTEGER PRIMARY KEY, date TEXT, title TEXT, description TEXT)',
      );
    });
  }

  Future<int> addNote(NoteModel note) async {
    final db = await init(); //open database
    return db.insert(
      "Note",
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<NoteModel>> getNote() async {
    final db = await init();
    final maps = await db.query("Note");

    return List.generate(maps.length, (i) {
      return NoteModel(
          id: maps[i]['id'] as int,
          date: maps[i]['date'] as String,
          title: maps[i]['title'] as String,
          description: maps[i]['description'] as String);
    });
  }

  Future<int> deleteNote(int id) async {
    final db = await init();

    int result = await db.delete("Note",
        where: "id = ?", whereArgs: [id] // whereArgs to avoid SQL injection
        );

    return result;
  }

  Future<int> updateNote(int id, NoteModel note) async {
    final db = await init();

    int result =
        await db.update("Note", note.toMap(), where: "id = ?", whereArgs: [id]);
    return result;
  }
}
