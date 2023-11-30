// import 'package:flutter/material.dart';
// import 'package:flutter_hicons/flutter_hicons.dart';
// import 'package:get/get.dart';
// import 'package:zoom_tap_animation/zoom_tap_animation.dart';
//
// import '../../../controller/navigation_controller.dart';
//
// class CustomBottomNavigationBar extends StatelessWidget {
//   final MainWrapperController controller = Get.find();
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       elevation: 0,
//       child: Container(
//         child: Obx(() => Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _bottomAppBarItem(context, icon: Hicons.home_3_light_outline, activeIcon: Hicons.home_3_bold, page: 0, label: "Home"),
//             _bottomAppBarItem(context, icon: Hicons.drop_light_outline, activeIcon: Hicons.drop_bold, page: 1, label: "Pakan"),
//             _bottomAppBarItem(context, icon: Hicons.voice_square_light_outline, activeIcon: Hicons.voice_square_bold, page: 2, label: "Deteksi"),
//             _bottomAppBarItem(context, icon: Hicons.discovery_2_light_outline, activeIcon: Hicons.discovery_2_bold, page: 3, label: "Suhu"),
//             _bottomAppBarItem(context, icon: Hicons.virus_light_outline, activeIcon: Hicons.virus_bold, page: 4, label: "pH Air"),
//           ],
//         )),
//       ),
//     );
//   }
//
//   Widget _bottomAppBarItem(BuildContext context, {required icon, required activeIcon, required page, required label}) {
//     return ZoomTapAnimation(
//       onTap: () => controller.goToTab(page),
//       child: Container(
//         color: Colors.transparent,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(controller.currentPage.value == page ? activeIcon : icon,
//                 color: controller.currentPage.value == page ? Colors.blue : Colors.grey),
//             Text(
//               label,
//               style: TextStyle(
//                 color: controller.currentPage.value == page ? Colors.blue : Colors.grey,
//                 fontSize: 15,
//                 fontWeight: controller.currentPage.value == page ? FontWeight.w600 : FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
