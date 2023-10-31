import 'package:flutter/material.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/button/component_primary_btn.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/textfield/component_primary_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});

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
                buildTextFieldWithLabel(
                  label: "Email",
                  icon: Icons.email,
                  isPassword: false,
                  controller: _emailTextController,
                ),
                const SizedBox(
                  height: 16,
                ),
                buildTextFieldWithLabel(
                  label: "Password",
                  icon: Icons.lock,
                  isPassword: true,
                  controller: _passwordTextController,
                ),
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
                  onPressed: () {
                    // Tambahkan fungsi yang ingin dijalankan saat tombol ditekan
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFieldWithLabel({
    required String label,
    required IconData icon,
    required bool isPassword,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: ListColor.gray700,
          ),
        ),
        const SizedBox(height: 8),
        PrimaryTextfield(label, icon, isPassword, controller),
      ],
    );
  }
}
