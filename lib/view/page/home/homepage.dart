import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';

class HomePage extends StatefulWidget {
  static String routeName = "/HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Iki cuman template page dadi lak pengen gae halaman baru'
            'kopi kode class TemplatePage terus diganti semisal DashboardPage'),
      ),
    );
  }
}
