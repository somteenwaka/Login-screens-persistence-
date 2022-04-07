import 'package:db_assignment/dashboard.dart';
import 'package:db_assignment/db.dart';
import 'package:db_assignment/dbOps.dart';
import 'package:db_assignment/elements.dart';
import 'package:db_assignment/models/user.dart';
import 'package:db_assignment/register.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  Color green = Color.fromARGB(255, 7, 7, 7);
  Color white = const Color(0xFFFFFFFF);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  loginUser(context) async {
    final db = await AppDatabase().initDB();
    String email = emailController.text;
    String password = passwordController.text;
    print(email + " " + password);

    List<User> users = await DBOperations(db).users();
    if (users.isNotEmpty) {
      int userId = users[0].id;
      await DBOperations(db).insertTokenRecord(userId);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserDetailPage(users: users)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/happyumbrella.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Center(
                    child: Icon(
                      Icons.account_circle,
                      color: white,
                      size: 150,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(50)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          Center(
                            child: Text("Hello there!",
                                style: TextStyle(
                                    color: green,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500)),
                          ),
                          const Center(
                            child: Text("Login to your account",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SingleTextInput(
                            placeholder: "Email address",
                            controller: emailController,
                          ),
                          const SizedBox(height: 10),
                          SingleTextInput(
                            placeholder: "Password",
                            controller: passwordController,
                          ),
                          const SizedBox(height: 8),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "Forgot password?",
                                  style: TextStyle(color: green),
                                )
                              ]),
                          const SizedBox(height: 120),
                          SingleButton(
                              placeholder: "Login",
                              col: "green",
                              pressAction: () {
                                loginUser(context);
                              }),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Don't have an account?",
                                  style: const TextStyle(color: Colors.grey),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '  Sign Up',
                                        style: TextStyle(color: green),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterPage()))),
                                  ],
                                ),
                              ),
                              // const Text(
                              //   "Don't have an account?",
                              // ),
                              // const SizedBox(width: 8),
                              // Text("Sign Up", style: TextStyle(color: green))
                            ],
                          ),
                          const SizedBox(height: 34)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
