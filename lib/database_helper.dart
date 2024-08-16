import 'package:cell_counter/model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('samples.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';
    const doubleType = 'REAL NOT NULL';
    const intType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE samples (
  id $idType,
  date $textType,
  name $textType,
  volume $doubleType,
  dilution $doubleType,
  quadrants $intType,
  vivas $intType,
  muertas $intType
  )
''');
  }

  Future<void> insertSample(Sample sample) async {
    final db = await instance.database;

    await db.insert(
      'samples',
      sample.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Sample>> fetchSamples() async {
    final db = await instance.database;

    final result = await db.query('samples');

    return result.map((json) => Sample.fromMap(json)).toList();
  }

  Future<void> deleteSample(int id) async {
    final db = await instance.database;

    await db.delete(
      'samples',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}