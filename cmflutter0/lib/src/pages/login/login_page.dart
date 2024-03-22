import 'package:cmflutter0/src/bloc/login/login_bloc.dart';
import 'package:cmflutter0/src/pages/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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
        title: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Text(
              "Login Page: ${state.count}",
              style: TextStyle(color: Colors.white),
            );
          },
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
                      // Text("Debug: ${context.read<LoginBloc>().state.count}"), ใช้แบบ one time
                      BlocBuilder<LoginBloc, LoginState>(
                        //ใช้แบบมีการ track ค่าของ state , เป็นการบอกให้ build แค่ตรงส่วนนี้
                        builder: (context, state) {
                          return Text("DebugX: ${state.count}");
                        },
                      ),
                      IconButton(
                        onPressed: () =>
                            context.read<LoginBloc>().add(LoginEventAdd()),
                        icon: Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () =>
                            context.read<LoginBloc>().add(LoginEventRemove()),
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
}
