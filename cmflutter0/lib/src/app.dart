import 'package:cmflutter0/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class CmApp extends StatelessWidget {
  const CmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          // ···
          brightness: Brightness.light,
        ),
      ),
      title: "CMApp",
      home: LoginPage(),
    );
  }
}
