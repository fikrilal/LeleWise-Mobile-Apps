import 'package:flutter/material.dart';
import 'package:lelewise_mobile_apps/view/component/reusableTextField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                24, MediaQuery.of(context).size.height * 0.2, 24, 0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                    "Email kamu", Icons.email, false, _emailTextController),
                const SizedBox(
                  height: 30,
                ),
                reusableTextField(
                    "Password", Icons.lock, true, _passwordTextController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
