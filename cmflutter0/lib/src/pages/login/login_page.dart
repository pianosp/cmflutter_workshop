import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _usernameController.text = "";
    _passwordController.text = "";
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
          child: Card(
            child: Container(
              height: 500,
              padding: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._buildTextFields(),
                  SizedBox(height: 32),
                  ..._buildButton(),
                  Row(
                    children: [
                      Text("Debug: ${_count}"),
                      IconButton(
                        onPressed: _handleClickAdd,
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: _handleClickRemove,
                        icon: Icon(Icons.remove),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _handleClickLogin() {
    // print(
    //     "CMDev: Login: with (${_usernameController.text}, ${_passwordController.text})");
    Navigator.pushNamed(context, AppRoute.home);
  }

  void _handleClickReset() {
    _usernameController.text = "";
    _passwordController.text = "";
  }

  _buildButton() {
    return [
      ElevatedButton(
        onPressed: _handleClickLogin,
        child: Text("Login"),
      ),
      OutlinedButton(
        onPressed: _handleClickRegister,
        child: Text("Register"),
      ),
      OutlinedButton(
        onPressed: _handleClickReset,
        child: Text("Reset"),
      )
    ];
  }

  _buildTextFields() {
    return [
      TextField(
        controller: _usernameController,
        decoration: InputDecoration(
          labelText: "Username",
        ),
      ),
      TextField(
        controller: _passwordController,
        decoration: InputDecoration(
          labelText: "Password",
        ),
      ),
    ];
  }

  void _handleClickRegister() {
    Navigator.pushNamed(context, AppRoute.register);
  }

  void _handleClickAdd() {
    setState(() {
      _count++;
    });
  }

  void _handleClickRemove() {
    setState(() {
      _count--;
    });
  }

}
