import 'package:floor/floor.dart';
import 'package:tasky/Floor/Dao/studentDao.dart';
import 'package:tasky/Floor/entity/student.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'database.g.dart';

@Database(version: 1, entities: [Student])
abstract class AppDatabase extends FloorDatabase {
  StudentDao get studentDao;
}
