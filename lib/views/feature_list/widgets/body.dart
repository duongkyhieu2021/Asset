import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/feature_list_controller.dart';
import 'package:sea_hr/controllers/main_controller.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    FeatureController featureController = Get.put(FeatureController());
    return Obx(() => Container(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          height: Get.size.height * 1 -
              kBottomNavigationBarHeight -
              kToolbarHeight * 1.5,
          child: ListView.builder(
            itemCount: featureController.viewedFeatures.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: index % 2 == 0 ? null : const Color(0xFFF1F1F1),
                leading: Image.asset(
                  featureController.viewedFeatures[index].image,
                  height: 30,
                ),
                title: Text(
                  featureController.viewedFeatures[index].name,
                  style: const TextStyle(fontSize: 16),
                ),
                onTap: () async {
                  switch (featureController.viewedFeatures[index].name) {
                    case "Tra cứu tài sản":
                      Get.find<MainController>()
                          .currentIndexOfNavigatorBottom
                          .value = 0;
                      await Get.toNamed(
                          featureController.viewedFeatures[index].redirectUrl);
                      break;
                  }
                },
                visualDensity: const VisualDensity(vertical: 1, horizontal: 0),
              );
            },
          ),
        ));
  }
}
