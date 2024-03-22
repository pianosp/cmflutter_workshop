import 'package:flutter/material.dart';

void main() {
  runApp(const CmApp());
}

class CmApp extends StatelessWidget {
  const CmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CMApp",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Text("Code Mobile"),
    );
  }
}
