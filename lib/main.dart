import 'package:flutter/material.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: const LoginPage(),
    );
  }
}
