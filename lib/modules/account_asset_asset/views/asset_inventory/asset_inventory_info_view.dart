import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/controller/asset_inventory_controller.dart';

import 'package:sea_hr/modules/account_asset_asset/views/asset_inventory/widgets/asset_inventory_general_view.dart';
import 'package:sea_hr/modules/account_asset_asset/views/asset_inventory/widgets/asset_inventory_list_view.dart';

import 'package:sea_hr/widgets/bottom_navigator_bar.dart';

class AssetInventoryInfoView extends StatelessWidget {
  final bool isCreate;
  const AssetInventoryInfoView({Key? key, required this.isCreate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final homeController = Get.put(HomeController());
    final assetInventoryController = Get.put(AssetInventoryController());
    print("Info page $isCreate");
    assetInventoryController.isCreate = isCreate.obs;
    return Obx(() {
      return assetInventoryController.status.value == 1
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: const Text("Thông tin kiểm kê"),
                bottom: TabBar(
                  controller: assetInventoryController.tabController,
                  isScrollable: true,
                  tabs: const [
                    Tab(text: "Thông tin chung"),
                    Tab(text: "Danh sách kiểm kê"),
                  ],
                ),
              ),
              bottomNavigationBar: homeController.status.value == 1
                  ? null
                  : const BottomNavigatorAppBar(),
              body: const Body(),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  if (assetInventoryController.isCreate == true.obs) {
                    assetInventoryController.createAssetInventory();
                    assetInventoryController.clearCurrentInventory();
                  }
                },
                backgroundColor: Theme.of(context).primaryColor,
                child: Text(assetInventoryController.isCreate == false.obs
                    ? "Lưu"
                    : "Tạo"),
              ),
            );
    });
  }
}

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetInventoryController inventoryController =
        Get.find<AssetInventoryController>();

    return TabBarView(
      controller: inventoryController.tabController,
      physics: const BouncingScrollPhysics(),
      children: const [
        AssetInventoryGeneralView(),
        AssetInventoryListView(),
      ],
    );
  }
}
