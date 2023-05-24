import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_committee_record.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_committee_repos.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_record.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_repos.dart';
import 'package:sea_hr/modules/hr_department_temporary/department_temporary.dart';
import 'package:sea_hr/modules/hr_department_temporary/department_temporary_repository.dart';
import 'package:sea_hr/modules/sea_office/sea_office.dart';
import 'package:sea_hr/modules/sea_office/sea_office_repository.dart';

class AssetInventoryController extends GetxController
    with GetTickerProviderStateMixin {
  Rx<bool> isCreate = false.obs;
  TabController? tabController;
  RxInt status = 0.obs;
  RxInt companyId = 0.obs;
  Rx<AssetInventoryRecord> assetInventory =
      AssetInventoryRecord.initAssetInventory().obs;

  Rx<AssetInventoryRecord> currentInventory =
      AssetInventoryRecord.initAssetInventory().obs;

  RxList<AssetInventoryRecord> listAssetInventory =
      <AssetInventoryRecord>[].obs;
  RxList<AssetInventoryCommitteeRecord> listAssetInventoryCommittee =
      <AssetInventoryCommitteeRecord>[].obs;
  RxList<DepartmentTemporary> listDepartment = <DepartmentTemporary>[].obs;
  RxList<SeaOffice> listSeaOffice = <SeaOffice>[].obs;

  @override
  void onInit() async {
    log("init Asset Inventory controler");
    status.value = 1;
    tabController = _createTabController(2);

    MainController mainController = Get.find<MainController>();
    OdooEnvironment env = mainController.env;
    AssetInventoryRepository assetInventoryRepositoryRepos =
        AssetInventoryRepository(env);
    AssetInventoryCommitteeRepository assetInventoryCommittee =
        AssetInventoryCommitteeRepository(env);
    SeaOfficeRepository seaOffice = SeaOfficeRepository(env);

    mainController.env.add(assetInventoryCommittee);
    mainController.env.add(seaOffice);
    mainController.env.add(assetInventoryRepositoryRepos);

    await env.of<AssetInventoryCommitteeRepository>().fetchRecords();
    await env.of<SeaOfficeRepository>().fetchRecords();
    await env.of<AssetInventoryRepository>().fetchRecords();
    await env.of<AssetInventoryRepository>().fetchRecords();
    await handleGetDepartmentByCompany();
    listAssetInventoryCommittee.value =
        assetInventoryCommittee.latestRecords.toList();

    listSeaOffice.value = seaOffice.latestRecords.toList();

    status.value = 2;
    super.onInit();
  }

  TabController _createTabController(int length) {
    return TabController(length: length, vsync: this);
  }

  Future<void> fechRecordsInventory() async {
    try {
      OdooEnvironment env = Get.find<MainController>().env;
      await env.of<AssetInventoryRepository>().fetchRecords();
      listAssetInventory.value =
          env.of<AssetInventoryRepository>().latestRecords;
    } catch (e) {
      log("$e", name: "AssetInventoryController fechRecordsInventory");
    }
  }

  Future<void> handleGetInventoryCommitteeByAssetInventoryId(
      int assetInventoryId) async {
    try {
      listAssetInventoryCommittee.value = listAssetInventoryCommittee
          .where((record) => record.assetInventoryId?[0] == assetInventoryId)
          .toList();
    } catch (e) {
      log("$e",
          name:
              "AssetInventoryController handleGetInventoryCommitteeByAssetInventoryId");
    }
  }

  Future<void> handleChooseInventoryInfo(AssetInventoryRecord inventory) async {
    try {
      assetInventory.value = inventory;
    } catch (e) {
      log("$e", name: "AssetInventoryController handleChooseInventoryInfo");
    }
  }

  void clearAssetInventory() {
    assetInventory.value = AssetInventoryRecord.initAssetInventory();
  }

  void clearCurrentInventory() {
    currentInventory.value = AssetInventoryRecord.initAssetInventory();
  }

  Future<void> handleGetDepartmentByCompany() async {
    try {
      OdooEnvironment env = Get.find<MainController>().env;
      HomeController homeController = Get.put(HomeController());

      DepartmentTemporaryRepository departmentRepository =
          DepartmentTemporaryRepository(env);
      List<dynamic> data =
          await departmentRepository.searchDepartmentTemporaryByCompanyId(
              homeController.companyUser.value.id);

      if (data.isNotEmpty) {
        listDepartment.value =
            data.map((e) => DepartmentTemporary.fromJson(e)).toList();
      }
      // log("listDepartment $listDepartment");
    } catch (e) {
      log("$e", name: "AssetInventoryController handleGetDepartmentByCompany");
    }
  }

  Future<void> createAssetInventory() async {
    try {
      OdooEnvironment env = Get.find<MainController>().env;
      AssetInventoryRepository assetInventory = AssetInventoryRepository(env);
      AssetInventoryRepository tempRepos = env.of<AssetInventoryRepository>();

      AssetInventoryRecord temp = AssetInventoryRecord.initAssetInventory();
      temp.name = currentInventory.value.name.toString();
      print("crurre ${currentInventory.value}");

      // final result = await assetInventory.create(temp);
      dynamic result = await tempRepos.create(currentInventory.value);
      print("result $result");
      isCreate = false.obs;
    } catch (e) {
      log("$e", name: "AssetInventoryController createAssetInventory");
    }
  }
}
