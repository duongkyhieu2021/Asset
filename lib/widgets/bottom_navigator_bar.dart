import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/theme.dart';

class BottomNavigatorAppBar extends StatelessWidget {
  const BottomNavigatorAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(WorkScheduleController());
    return Obx(
      () => Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFFF1F1F1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: BottomNavigationBar(
          elevation: 15,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 12,
          unselectedFontSize: 11,
          showUnselectedLabels: true,
          backgroundColor: const Color(0xFFFBFBFB),
          selectedIconTheme:
              IconThemeData(color: ThemeApp.light().primaryColor),
          selectedItemColor: ThemeApp.light().primaryColor,
          unselectedItemColor: Colors.grey,
          unselectedLabelStyle:
              const TextStyle(color: Color.fromARGB(255, 36, 21, 21)),
          selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.w500,
              color: ThemeApp.light().primaryColor),
          currentIndex:
              Get.find<MainController>().currentIndexOfNavigatorBottom.value,
          onTap: (int? index) {
            Get.find<MainController>().currentIndexOfNavigatorBottom.value =
                index!;
            switch (index) {
              case 0:
                Get.toNamed("/home");
                return;
              case 1:
                Get.toNamed('/asset_inventory');
            }
          },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Tài sản',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.inventory_rounded),
              label: 'Kiểm kê',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Tài khoản',
            ),
          ],
        ),
      ),
    );
  }
}
