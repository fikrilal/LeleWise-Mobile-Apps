import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lelewise_mobile_apps/view/component/button/navigation_menu.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';
import 'package:lelewise_mobile_apps/view/page/deteksi/deteksi_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/deteksi/hasil_deteksi.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';
import 'controller/navigation_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final MainWrapperController mainController = MainWrapperController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Satoshi'),
          initialRoute: PakanDashboard.routeName,
          getPages: [
            GetPage(name: PakanDashboard.routeName, page: () => PakanDashboard()),
            GetPage(name: DeteksiPage.routeName, page: () => DeteksiPage()),
            GetPage(name: HasilDeteksi.routeName, page: () => HasilDeteksi()),
            GetPage(name: HomePage.routeName, page: () => HomePage()),
            GetPage(name: LoginPage.routeName, page: () => LoginPage())
          ],
        );
      },
    );
  }
}
