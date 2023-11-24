import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lelewise_mobile_apps/view/component/time_picker/time_picker.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';
import 'package:lelewise_mobile_apps/view/page/notifikasi/notifikasi_dashboard.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          initialRoute: LoginPage.routeName,
          getPages: [
            GetPage(name: LoginPage.routeName, page: () => LoginPage()),
            GetPage(name: TestingWidgetPage.routeName!, page: () => NotifikasiPage()),
            GetPage(name: HomePage.routeName, page: () => HomePage()),
            GetPage(name: LoginPage.routeName!, page: () => LoginPage())
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
