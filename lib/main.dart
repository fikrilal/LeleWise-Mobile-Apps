import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lelewise_mobile_apps/view/page/auth/login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      builder: (context,child){
        return  GetMaterialApp(
          theme: ThemeData(fontFamily: 'Satoshi'),
          initialRoute: LoginPage.routeName,
          getPages: [
            GetPage(name: LoginPage.routeName, page: ()=> LoginPage()),
            // ben penak digae ngene ben rapi juga

          ],
        );
      },
    );

  }
}


class TemplatePage extends StatefulWidget {
  static String? routeName = "/namaHalaman";
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
