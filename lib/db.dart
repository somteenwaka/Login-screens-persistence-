import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  Future<Database> initDB() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'app_database.db'),
      onCreate: (db, version) async {
        // Run the CREATE TABLE statement on the database.
        await db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, firstName TEXT, lastName TEXT, email TEXT UNIQUE, password TEXT); CREATE TABLE tokens(userId PRIMARY KEY, token TEXT)',
        );
        await db.execute(
          'CREATE TABLE tokens(userId PRIMARY KEY, token TEXT)',
        );
      },
      version: 1,
    );

    // Open the database and store the reference.
    return database;
  }
}
