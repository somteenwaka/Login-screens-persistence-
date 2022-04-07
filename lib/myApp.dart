import 'package:db_assignment/dashboard.dart';
import 'package:db_assignment/db.dart';
import 'package:db_assignment/dbOps.dart';
import 'package:db_assignment/login.dart';
import 'package:db_assignment/models/token.dart';
import 'package:db_assignment/models/user.dart';
import 'package:db_assignment/register.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool loggedIn = false;
  bool hasloginDetails = false;
  late List<User> users;
  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  checkLogin() async {
    final db = await AppDatabase().initDB();
    List<Token> token = await DBOperations(db).tokens();
    print(token);
    if (token.isNotEmpty) {
      loggedIn = true;
    } else {
      users = await DBOperations(db).users();
      print(users);
      if (users.isNotEmpty) {
        hasloginDetails = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: loggedIn
            ? UserDetailPage(users: users)
            : hasloginDetails
                ? LoginPage()
                : RegisterPage());
  }
}
