import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:lelewise_mobile_apps/view/page/air/suhu_air_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/home/homepage.dart';
import 'package:lelewise_mobile_apps/view/page/pH/pH_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_dashboard.dart';
import 'package:lelewise_mobile_apps/view/page/pakan/pakan_new_schedule.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavbarController());
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 80.h,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(
              icon: controller.selectedIndex.value == 0
                  ? const Icon(Hicons.home_3_bold, color: Colors.blue) // Ikon berubah ketika aktif
                  : const Icon(Hicons.home_3_light_outline, color: Colors.grey),
              label: 'Home',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 1
                  ? const Icon(Hicons.discovery_2_bold, color: Colors.blue)
                  : const Icon(Hicons.discovery_2_light_outline, color: Colors.grey),
              label: 'Pakan',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 2
                  ? const Icon(Hicons.voice_square_bold, color: Colors.blue)
                  : const Icon(Hicons.voice_square_light_outline, color: Colors.grey),
              label: 'Deteksi',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 3
                  ? const Icon(Hicons.drop_bold, color: Colors.blue)
                  : const Icon(Hicons.drop_light_outline, color: Colors.grey),
              label: 'Suhu',
            ),
            NavigationDestination(
              icon: controller.selectedIndex.value == 4
                  ? const Icon(Hicons.virus_bold, color: Colors.blue)
                  : const Icon(Hicons.virus_light_outline, color: Colors.grey),
              label: 'pH Air',
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavbarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [HomePage(), PakanDashboard(), NewSchedulePage(), SuhuAirPage(), PHPage()];
}
