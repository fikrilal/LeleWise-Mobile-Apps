import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return LoginPage();
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
