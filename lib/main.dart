import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lelewise_mobile_apps/view/component/button/navigation_menu.dart';
import 'package:lelewise_mobile_apps/view/component/time_picker/time_picker.dart';
import 'package:lelewise_mobile_apps/view/page/air/suhu_air_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';
import 'package:lelewise_mobile_apps/view/page/deteksi/hasil_deteksi.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';
import 'package:lelewise_mobile_apps/view/page/notifikasi/detail_notifikasi.dart';
import 'package:lelewise_mobile_apps/view/page/notifikasi/notifikasi_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pH/pH_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_new_schedule.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(fontFamily: 'Satoshi'),
          initialRoute: PakanDashboard.routeName,
          getPages: [
            GetPage(name: LoginPage.routeName, page: () => LoginPage()),
            GetPage(
                name: TestingWidgetPage.routeName!,
                page: () => NotifikasiPage())
            // ben penak digae ngene ben rapi juga
            ,
            GetPage(name: LoginPage.routeName, page: () => LoginPage()),
            GetPage(name: HomePage.routeName, page: () => HomePage()),
            GetPage(name: NewSchedulePage.routeName!, page: () => HomePage()),
            GetPage(
                name: PakanDashboard.routeName!, page: () => NavigationMenu())
          ],
        );
      },
    );
  }
}

class TestingWidgetPage extends StatefulWidget {
  static String? routeName = "/testingWidget";
  @override
  _TestingWidgetPageState createState() => _TestingWidgetPageState();
}

class _TestingWidgetPageState extends State<TestingWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TimePickerLele(),
      ),
    );
  }
}

class TemplatePage extends StatefulWidget {
  static String? routeName = "/TemplatePage";
  @override
  _TemplatePageState createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
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
