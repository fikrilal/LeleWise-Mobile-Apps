import 'package:flutter/material.dart';
import 'package:flutter_hicons/flutter_hicons.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:lelewise_mobile_apps/controller/navigation_controller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final MainWrapperController controller;

  BottomNavigationBarWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 10,
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomAppBarItem(
                      context,
                      icon: Hicons.home_3_light_outline,
                      activeIcon: Hicons.home_3_bold,
                      page: 0,
                      label: "Home",
                    ),
                    _bottomAppBarItem(
                      context,
                      icon: Hicons.drop_light_outline,
                      activeIcon: Hicons.drop_bold,
                      page: 1,
                      label: "Pakan",
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  transform: Matrix4.translationValues(0, -16, 0),
                  child: ZoomTapAnimation(
                    onTap: () {
                      // Add your action when the button is pressed
                    },
                    child: Transform.scale(
                      scale: 2, // Adjust the scale factor as needed
                      child: FloatingActionButton(
                        backgroundColor: Colors.blue, // Change the color accordingly
                        mini: true,
                        elevation: 0,
                        onPressed: () {},
                        child: SvgPicture.asset(
                          'assets/icons/Scan.svg',
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _bottomAppBarItem(
                      context,
                      icon: Hicons.discovery_2_light_outline,
                      activeIcon: Hicons.discovery_2_bold,
                      page: 2,
                      label: "Suhu",
                    ),
                    _bottomAppBarItem(
                      context,
                      icon: Hicons.virus_light_outline,
                      activeIcon: Hicons.virus_bold,
                      page: 3,
                      label: "pH Air",
                    ),
                  ],
                ),
              ),
            ],
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
              color: controller.currentPage.value == page ? Colors.blue : Colors.grey, // Change the colors accordingly
            ),
            Text(
              label,
              style: TextStyle(
                color: controller.currentPage.value == page ? Colors.blue : Colors.grey,
                fontSize: 15,
                fontWeight: controller.currentPage.value == page ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
