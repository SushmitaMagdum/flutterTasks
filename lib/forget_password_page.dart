import 'package:flutter/material.dart';

class ForgetPassPage extends StatelessWidget {
  const ForgetPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password Page'),
        backgroundColor: Colors.black,
      ),
      // ignore: prefer_const_constructors
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(15),
        child: const Text("Password Reset Link Sent...",
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontStyle: FontStyle.italic)),
      ),
    );
  }
}
