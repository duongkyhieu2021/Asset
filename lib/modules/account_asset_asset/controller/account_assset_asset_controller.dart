import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/account_asset_asset_record.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/account_asset_asset_repos.dart';

class AccountAssetController extends GetxController {
  TabController? tabController;
  RxInt status = 0.obs;
  // RxInt selected = 0.obs;

  RxList<AccountAssetAssetRecord> listAccountAsset =
      <AccountAssetAssetRecord>[].obs;
  Rx<TextEditingController> searchCodeController = TextEditingController().obs;
  Rx<String?> searchCode = "".obs;
  Rx<AccountAssetAssetRecord?> asset = Rx(null);
  // Rx<Sign> selectedSign = Sign(id: 0, documentDetail: const []).obs;

  String statusSign(String value) {
    switch (value) {
      case "draft":
        return "Nháp";
      case "open":
        return "Đang sử dụng";
      case "pending":
        return "Đang chờ";
      case "liquidation":
        return "Thanh lý";
      case "close":
        return "Đã đóng";
    }
    return "Unknown state";
  }

  Color statusSignColor(String value) {
    switch (value) {
      case "draft":
        return Colors.grey;
      case "open":
        return Colors.red;
      case "pending":
        return Colors.orange;
      case "liquidation":
        return Colors.green;
      case "close":
        return Colors.red;
    }
    return Colors.grey;
  }

  @override
  void onInit() async {
    log("init Acount asset controler");
    status.value = 1;
    MainController mainController = Get.find<MainController>();
    //tabController = TabController(length: 2, vsync: this);
    OdooEnvironment env = mainController.env;
    AccountAssetRepository accountAsset = AccountAssetRepository(env);

    env.add(AccountAssetRepository(env));
    await env.of<AccountAssetRepository>().fetchRecords();
    listAccountAsset.value = accountAsset.latestRecords.toList();
    status.value = 2;
    super.onInit();
  }

  Future<void> searchAssetByCode(String value) async {
    MainController mainController = Get.find<MainController>();
    //tabController = TabController(length: 2, vsync: this);
    OdooEnvironment env = mainController.env;
    AccountAssetRepository accountAsset = AccountAssetRepository(env);
    List<dynamic> data = await accountAsset.handleSearchAssetNameOrCode(value);

    if (data.isEmpty) {
      listAccountAsset.value = accountAsset.latestRecords
          .where((element) => element.code == value)
          .toList();
    } else {
      listAccountAsset.value =
          data.map((e) => AccountAssetAssetRecord.fromJson(e)).toList();
    }

    //dkh add get data from sea.sign.role
    mainController.env.add(AccountAssetRepository(mainController.env));
    await mainController.env.of<AccountAssetRepository>().fetchRecords();
  }
}
