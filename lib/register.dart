import 'package:db_assignment/db.dart';
import 'package:db_assignment/dbOps.dart';
import 'package:db_assignment/elements.dart';
import 'package:db_assignment/login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

class RegisterPage extends StatelessWidget {
  Color green = const Color.fromARGB(255, 109, 108, 3);
  Color white = const Color(0xFFFFFFFF);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  RegisterPage({Key? key}) : super(key: key);

  registerUser(context) async {
    final db = await AppDatabase().initDB();
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    await DBOperations(db)
        .insertUserRecord(firstName, lastName, email, password);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
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
                  const SizedBox(height: 12),
                  Center(
                      child: Column(
                    children: [
                      Text("Register",
                          style: TextStyle(
                              color: white,
                              fontSize: 40,
                              fontWeight: FontWeight.w500)),
                      Text("Create your new account",
                          style: TextStyle(
                            color: white,
                            fontSize: 20,
                          ))
                    ],
                  )),
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
                          const SizedBox(
                            height: 20,
                          ),
                          SingleTextInput(
                            placeholder: "First name",
                            controller: firstNameController,
                          ),
                          const SizedBox(height: 10),
                          SingleTextInput(
                            placeholder: "Last name",
                            controller: lastNameController,
                          ),
                          const SizedBox(height: 10),
                          SingleTextInput(
                            placeholder: "Email",
                            controller: emailController,
                          ),
                          const SizedBox(height: 10),
                          SingleTextInput(
                            placeholder: "Password",
                            controller: passwordController,
                          ),
                          const SizedBox(height: 8),
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Colors.grey),
                              children: <TextSpan>[
                                const TextSpan(
                                    text:
                                        'By clicking Sign Up, you agree to our '),
                                TextSpan(
                                    text: 'Terms of Service',
                                    style: TextStyle(color: green),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Terms of Service"');
                                      }),
                                const TextSpan(
                                    text: ' and that you have read our '),
                                TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(color: green),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        print('Privacy Policy"');
                                      }),
                              ],
                            ),
                          ),
                          const SizedBox(height: 80),
                          SingleButton(
                              placeholder: "Sign up",
                              col: "green",
                              pressAction: () {
                                registerUser(context);
                              }),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: "Already have an account?",
                                  style: const TextStyle(color: Colors.grey),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '  Login',
                                        style: TextStyle(color: green),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()))),
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
