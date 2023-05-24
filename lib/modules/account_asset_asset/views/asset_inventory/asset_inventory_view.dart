import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/controller/asset_inventory_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_record.dart';
import 'package:sea_hr/theme.dart';
import 'package:sea_hr/views/drawer/dialog_select_company.dart';
import 'package:sea_hr/views/drawer/drawer.dart';
import 'package:sea_hr/widgets/bottom_navigator_bar.dart';
import 'package:sea_hr/widgets/list_empty.dart';

class AssetInventoryView extends StatelessWidget {
  const AssetInventoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    final assetInventoryController = Get.put(AssetInventoryController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    assetInventoryController.fechRecordsInventory();
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Obx(() => Scaffold(
            key: scaffoldKey,
            appBar: homeController.status.value == 1
                ? null
                : AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 1,
                    title: Row(
                      children: [
                        (homeController.user.value.image == null) ||
                                (homeController.user.value.image) == ""
                            ? const CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage("assets/images/avatar.png"))
                            : CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.transparent,
                                backgroundImage: MemoryImage(
                                  base64Decode(
                                      homeController.user.value.image ?? ""),
                                ),
                              ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                homeController.user.value.name ?? "",
                                style: const TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                homeController.companyUser.value.name,
                                style: const TextStyle(
                                    fontSize: 11,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      PopupMenuButton(
                          elevation: 5,
                          offset: const Offset(0, kToolbarHeight),
                          icon: const Icon(Icons.settings),
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem<int>(
                                value: 0,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.sync,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("Chuyển công ty"),
                                  ],
                                ),
                              ),
                              const PopupMenuItem<int>(
                                value: 1,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Colors.black,
                                      size: 22,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Text("Đăng xuất"),
                                  ],
                                ),
                              ),
                            ];
                          },
                          onSelected: (value) {
                            if (value == 0) {
                              if (homeController.companiesOfU.isNotEmpty &&
                                  homeController.companiesOfU[0].id != 0) {
                                Get.bottomSheet(const DialogSelectCompany());
                              }
                            } else if (value == 1) {
                              Get.dialog(AlertDialog(
                                title: const Text("Xác nhận"),
                                content: const Text("Bạn có muốn đăng xuất?"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "Hủy",
                                        style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 92, 90, 90),
                                            fontSize: 16),
                                      )),
                                  TextButton(
                                      onPressed:
                                          Get.find<MainController>().logout,
                                      child: const Text(
                                        "Đăng xuất",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 16),
                                      )),
                                ],
                              ));
                            }
                          }),
                    ],
                  ),
            drawer: const Drawer(
              backgroundColor: Colors.white,
              child: DrawerHome(),
            ),
            body: Obx(() => assetInventoryController.status.value == 1
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : assetInventoryController.listAssetInventory.isEmpty
                    ? const ListEmpty(
                        title: "Kiểm kê trống",
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount:
                            assetInventoryController.listAssetInventory.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              _ItemInventory(
                                inventory: assetInventoryController
                                    .listAssetInventory[index],
                              ),
                            ],
                          );
                        })),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                assetInventoryController.clearAssetInventory();
                Get.toNamed("/asset_inventory_info_create");
              },
              backgroundColor: Theme.of(context).primaryColor,
              child: const Text("Tạo"),
            ),
            bottomNavigationBar: homeController.status.value == 1
                ? null
                : const BottomNavigatorAppBar(),
          )),
    );
  }
}

class _ItemInventory extends StatelessWidget {
  final AssetInventoryRecord inventory;
  const _ItemInventory({
    required this.inventory,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final assetInventoryController = Get.put(AssetInventoryController());
        assetInventoryController.handleChooseInventoryInfo(inventory);
        Get.toNamed("/asset_inventory_info");
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _InventoryTitle(title: inventory.name ?? 'Trống tên'),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _InventoryInfo(
                          icon: Icons.home_work_outlined,
                          name: inventory.id.toString(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InventoryTitle extends StatelessWidget {
  final String title;
  const _InventoryTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: ThemeApp.textStyle(
          fontWeight: FontWeight.bold, color: const Color(0xff448bc0)),
    );
  }
}

class _InventoryInfo extends StatelessWidget {
  final IconData icon;
  final String name;
  final int? maxLine;
  const _InventoryInfo({
    required this.icon,
    required this.name,
    this.maxLine,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              name,
              maxLines: maxLine ?? 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
