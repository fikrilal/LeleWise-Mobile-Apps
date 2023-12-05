import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';
import 'package:lelewise_mobile_apps/view/page/deteksi/deteksi_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/deteksi/hasil_deteksi.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';
import 'controller/navigation/navigation_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Satoshi'),
          routerConfig: NavigationController.router,
        );
      },
    );
  }
}
