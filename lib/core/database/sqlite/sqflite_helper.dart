import 'package:sqflite/sqflite.dart';
import 'package:todoapp/feature/task/data/models/taskModel.dart';

class SqfliteHelper {
  late Database db;
  void intiDB() async {
    await openDatabase(
      'tasks.db',
      version: 1,
      onCreate: (Database db, int v) async {
        return await db.execute('''
      CREATE TABLE Tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        note TEXT,
        date TEXT,
        startTime TEXT,
        endTime TEXT,
        color INTEGER,
        isCombleted INTEGER )
      ''').then(
          (value) => print('DB created successfully'),
        );
      },
      onOpen: (db) => print('Database opened'),
    ).then((value) => db = value);
  }

  //!get
  Future<List<Map<String, dynamic>>> getFromDB() async {
    return await db.rawQuery('SELECT * FROM Tasks');
  }

  //! insert
  Future<int> insertToDB(TaskModel model) async {
    return await db.rawInsert('''
      INSERT INTO Tasks( 
      title ,note ,date ,startTime ,endTime ,color ,isCombleted )
         VALUES
         ('${model.title}','${model.note}','${model.date}','${model.startTime}',
       '${model.endTime}','${model.color}','${model.isCombleted}')''');
  }

  //! update
  Future<int> updatedDB(int id) async {
    return await db.rawUpdate('''
    UPDATE Tasks
    SET isCombleted = ?
    WHERE id = ?
   ''', [1, id]);
  }

  //! delete
  Future<int> deleteFromDB(int id) async {
    return await db.rawDelete(
      '''DELETE FROM Tasks WHERE id = ?''',
      [id],
    );
  }
}