import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/objects/feature.dart';

class FeatureController extends GetxController
    with GetSingleTickerProviderStateMixin {
  Rx<TabController?> controller = Rx(null);
  OdooEnvironment env = Get.find<MainController>().env;

  RxInt selectedTabIndex = 0.obs;

  RxList<String> listOfCategories = <String>[].obs;
  RxList<Feature> features = <Feature>[].obs;
  RxList<Feature> viewedFeatures = <Feature>[].obs;
  List<Map<String, String>> featuresInJson = [
    // {
    //   "name": "Tra cứu tài sản",
    //   "image": "assets/images/clock.png",
    //   "redirectUrl": "/home",
    //   "categoryName": "Tài sản"
    // },
    // {
    //   "name": "Lịch làm việc",
    //   "image": "assets/images/calendar.png",
    //   "redirectUrl": "/attendance_calendar",
    //   "categoryName": "Nhân sự"
    // },
    // {
    //   "name": "Ca làm việc",
    //   "image": "assets/images/work-schedule.png",
    //   "redirectUrl": "/shift_info",
    //   "categoryName": "Hành chánh"
    // },
    // {
    //   "name": "Bảng chấm công",
    //   "image": "assets/images/check.png",
    //   "redirectUrl": "/attendance_schedule",
    //   "categoryName": "Nhân sự"
    // },
    //dkh+
    // {
    //   "name": "Văn bản đi",
    //   "image": "assets/images/check.png",
    //   "redirectUrl": "/sea_sign_view",
    //   "categoryName": "Trình ký"
    // },
  ];

  @override
  void onInit() {
    super.onInit();

    List<Feature> listOfFeature = [];

    for (var e in featuresInJson) {
      Feature feature = Feature(
          name: e["name"].toString(),
          image: e["image"].toString(),
          redirectUrl: e["redirectUrl"].toString(),
          categoryName: e["categoryName"].toString());
      listOfFeature.add(feature);
    }

    features.value = listOfFeature;
    viewedFeatures.value = listOfFeature;

    List<String> listOfCategory = ["Tất cả"];

    for (Feature e in features) {
      bool existingCategory = listOfCategory.contains(e.categoryName);
      if (!existingCategory) {
        listOfCategory.add(e.categoryName);
      }
    }

    listOfCategories.value = listOfCategory;

    controller.value =
        TabController(vsync: this, length: listOfCategory.length);
    controller.value!.addListener(() async {
      String chosenCategory = listOfCategories[controller.value!.index];

      if (chosenCategory == 'Tất cả') {
        viewedFeatures.value = features;
      } else {
        List<Feature> featuresBasedOnChosenCategory = [...features]
            .where((p0) => p0.categoryName == chosenCategory)
            .toList();
        viewedFeatures.value = featuresBasedOnChosenCategory;

        selectedTabIndex.value = controller.value!.index;
      }
    });
  }

  @override
  void onClose() {
    controller.value!.dispose();
    super.onClose();
  }
}
