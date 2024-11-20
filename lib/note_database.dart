import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'note.dart';

class NoteDatabase {
  static final NoteDatabase _instance = NoteDatabase._internal();
  factory NoteDatabase() => _instance;

  NoteDatabase._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'notes.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, text TEXT NOT NULL, created_at TEXT)',
        );
      },
    );
  }

  Future<void> insertNote(Note note) async {
    final db = await database;
    await db.insert('notes', note.toMap());
  }

  Future<List<Note>> getNotes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('notes');

    return List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        text: maps[i]['text'],
        createdAt: maps[i]['created_at'],
      );
    });
  }
}
