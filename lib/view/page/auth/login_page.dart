import 'package:flutter/material.dart';
import 'package:lelewise_mobile_apps/view/component/reusableTextField.dart';

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
                Text(
                  "Masukkan email dan password kamu untuk masuk ke aplikasi LeleWise",
                  style: TextStyle(
                    fontFamily: 'Ananda',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                    fontSize: 18,
                    color: Color(0xff6B7280),
                  ),
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
                        color: Color(0xFF1C64F2),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                reusableButton(
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
            color: Color(0xff374151),
          ),
        ),
        const SizedBox(height: 8),
        reusableTextField(label, icon, isPassword, controller),
      ],
    );
  }
}

class ComponentTextHeader extends StatelessWidget {
  String? text;
  ComponentTextHeader(this.text);
  @override
  Widget build(BuildContext context) {
    return Text(
      "${text}",
      style: TextStyle(
        fontFamily: 'Ananda',
        fontSize: 30,
        color: Color(0xff374151),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
