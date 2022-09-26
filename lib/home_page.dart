import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.black,
      ),
      // ignore: prefer_const_constructors
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: const Text(
            "WELCOME TO HOME PAGE... You've successfully logged in",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontStyle: FontStyle.italic)),
      ),
    );
  }
}
