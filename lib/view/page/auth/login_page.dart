import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/button/component_primary_btn.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/textfield/component_primary_textfield.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("User not found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ComponentTextHeader("Masuk ke Akun Kamu"),
                const SizedBox(
                  height: 8,
                ),
                TextDescription(
                  "Masukkan email dan password kamu untuk masuk ke aplikasi LeleWise",
                  textcolor: ListColor.gray500,
                ),
                const SizedBox(
                  height: 32,
                ),
                PrimaryTextfield("Password test", "assets/icons/email_icon.svg",
                    true, _passwordTextController, 12.0, 12.0, Colors.black12),
                const SizedBox(
                  height: 2,
                ),
                const SizedBox(
                  height: 16,
                ),
                PrimaryTextfield(
                    "Password test",
                    "assets/icons/password_icon.svg",
                    true,
                    _passwordTextController,
                    12,
                    12,
                    Colors.black26),
                const SizedBox(
                  height: 2,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      // Tambahkan fungsi yang ingin dijalankan saat tombol ditekan
                    },
                    child: const Text(
                      "Lupa password?",
                      style: TextStyle(
                        fontFamily: 'Satoshi',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        color: ListColor.blue600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                primaryButton(
                  text: "Masuk",
                  onPressed: () async {
                    User? user = await loginUsingEmailPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text,
                        context: context);
                    print(user);
                    if (user != null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
