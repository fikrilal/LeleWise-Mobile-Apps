import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get.dart';
import 'package:lelewise_mobile_apps/controller/navigation_controller.dart';
import 'package:lelewise_mobile_apps/res/colors/color_libraries.dart';
import 'package:lelewise_mobile_apps/view/page/air/suhu_air_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';
import 'package:lelewise_mobile_apps/view/page/pH/pH_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class NavigationMenu extends StatelessWidget {
  NavigationMenu({super.key});

  final MainWrapperController controller = Get.put(MainWrapperController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        onPageChanged: controller.animateToTab,
        controller: controller.pageController,
        physics: const BouncingScrollPhysics(),
        children: [
          HomePage(),
          PakanDashboard(),
          SuhuAirPage(),
          PHPage(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 10,
        elevation: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _bottomAppBarItem(context, icon: Hicons.home_3_light_outline, activeIcon: Hicons.home_3_bold, page: 0, label: "Home"),
                _bottomAppBarItem(context, icon: Hicons.drop_light_outline, activeIcon: Hicons.drop_bold, page: 1, label: "Pakan"),
                _bottomAppBarItem(context, icon: Hicons.discovery_2_light_outline, activeIcon: Hicons.discovery_2_bold, page: 2, label: "Suhu"),
                _bottomAppBarItem(context, icon: Hicons.virus_light_outline, activeIcon: Hicons.virus_bold, page: 3, label: "pH"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBarItem(BuildContext context, {required icon, required activeIcon, required page, required label}) {
    return ZoomTapAnimation(
      onTap: () => controller.goToTab(page),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
            controller.currentPage.value == page ? activeIcon : icon,
            color: controller.currentPage.value == page ? ListColor.primary : ListColor.gray400),
            Text(label,
            style: TextStyle(
              color: controller.currentPage.value == page ? ListColor.primary : ListColor.gray400,
              fontSize: 15,
              fontWeight: controller.currentPage.value == page ? FontWeight.w600 : FontWeight.w500,
            ),)
          ],
        ),
      ),
    );
  }
}

