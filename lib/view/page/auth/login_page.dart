import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/button/component_primary_btn.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_textlabel.dart';
import 'package:lelewise_mobile_apps/view/component/textfield/component_primary_textfield.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key});
  static String routeName = "/LoginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16.w, 60.h, 16.w, 24.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ComponentTextHeader("Masuk ke Akun Kamu"),
                SizedBox(
                  height: 8.h,
                ),
                TextDescription(
                  "Masukkan email dan password kamu untuk masuk ke aplikasi LeleWise",
                  textcolor: ListColor.gray500,
                ),
                SizedBox(
                  height: 24.h,
                ),
                TextLabel("Email"),
                SizedBox(
                  height: 8.h,
                ),
                PrimaryTextfield("Email", "assets/icons/email_icon.svg", false,
                    _emailTextController, ListColor.gray500),
                SizedBox(
                  height: 16.h,
                ),
                TextLabel("Password"),
                SizedBox(
                  height: 8.h,
                ),
                PrimaryTextfield("Password", "assets/icons/password_icon.svg",
                    true, _passwordTextController, ListColor.gray500),
                SizedBox(
                  height: 2.h,
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
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: ListColor.blue600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32.h,
                ),
                primaryButton(text: "Masuk", onPressed: () async {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
