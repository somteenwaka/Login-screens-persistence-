import 'package:db_assignment/models/token.dart';
import 'package:db_assignment/models/user.dart';
import 'package:sqflite/sqflite.dart';

class DBOperations {
  final Database _database;

  DBOperations(this._database);

  Future<void> insertUserRecord(
      String firstName, String lastName, String email, String password) async {
    Map<String, Object> userMap = {
      "id": DateTime.now().millisecond,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    };

    await _database.insert(
      'users',
      userMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> insertTokenRecord(int userId) async {
    Map<String, Object> tokenMap = {
      "token": "TK${DateTime.now().millisecond}",
      "userId": userId
    };

    await _database.insert(
      'tokens',
      tokenMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<User>> users() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');
    return List.generate(maps.length, (i) {
      return User(
          id: maps[i]['id'],
          firstName: maps[i]['firstName'],
          lastName: maps[i]['lastName'],
          email: maps[i]['email']);
    });
  }

  Future<List<Token>> tokens() async {
    final List<Map<String, dynamic>> maps = await _database.query('tokens');
    return List.generate(maps.length, (i) {
      return Token(userId: maps[i]['userId'], token: maps[i]['token']);
    });
  }
}
