import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: "Username",
                ),
              ),
              ElevatedButton(
                onPressed: _handleClickLogin,
                child: Text("Login"),
              ),
              OutlinedButton(
                onPressed: _handleClickReset,
                child: Text("Reset"),
              )

            ],
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    print("CMDev: Login ${_usernameController.text}");
  }

  void _handleClickReset() {
    _usernameController.text = "";
  }
}
