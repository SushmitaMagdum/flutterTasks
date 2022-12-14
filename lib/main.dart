// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';
import 'forget_password_page.dart';

String finalEmail = "";
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  const LoginDemo({super.key});

  @override
  State<LoginDemo> createState() => _LoginDemoState();
}

class _LoginDemoState extends State<LoginDemo> {
  @override
  void initState() {
    checkUserLoggedIn().whenComplete(() async {
      if (finalEmail.isNotEmpty) {
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
    super.initState();
  }

  Future checkUserLoggedIn() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var email = sharedPreferences.getString('email');
    setState(() {
      finalEmail = email!;
    });
    print(finalEmail);
  }

  String userEmail = "";
  String userPassword = "";
  final focus = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login Page'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60, bottom: 20),
              child: Center(
                child: Text(
                  "Login",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 35),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus);
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@gmail.com'),
                onChanged: (value) {
                  userEmail = value;
                },
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
              child: TextFormField(
                obscureText: true,
                onFieldSubmitted: (v) {
                  FocusScope.of(context).requestFocus(focus);
                },
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
                onChanged: (value) {
                  userPassword = value;
                },
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ForgetPassPage()),
                );
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  if (isValidEmail()) {
                    if (isValidPassword()) {
                      final SharedPreferences sharedPreferences =
                          await SharedPreferences.getInstance();
                      sharedPreferences.setString('email', userEmail);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()),
                      );
                    }
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool isValidEmail() {
    RegExp regex = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (userEmail.isEmpty) {
      showAlertDialog(context, "Please Enter Your Email..");
    } else if (!(regex.hasMatch(userEmail))) {
      showAlertDialog(context, "Invalid Email..");
    } else {
      return true;
    }
    return false;
  }

  bool isValidPassword() {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (userPassword.isEmpty) {
      showAlertDialog(context, "Please Enter Your Password..");
    } else if (!(regex.hasMatch(userPassword))) {
      showAlertDialog(context, "Invalid Password..");
    } else {
      return true;
    }
    return false;
  }
}

showAlertDialog(BuildContext context, String errorMsg) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  AlertDialog alert = AlertDialog(
    title: Text(
      "Warning",
      style: TextStyle(color: Colors.red, fontSize: 15),
    ),
    content: Text(errorMsg),
    actions: [
      okButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
