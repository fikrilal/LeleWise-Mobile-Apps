import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_desc.dart';
import 'package:lelewise_mobile_apps/view/component/text/component_header.dart';

import '../../component/button/component_primary_btn.dart';
import '../../component/time_picker/time_picker.dart';

class PakanWeightPage extends StatefulWidget {
  static String? routeName = "/TemplatePage";
  @override
  _PakanWeightPageState createState() => _PakanWeightPageState();
}

class _PakanWeightPageState extends State<PakanWeightPage> {
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