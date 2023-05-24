import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/theme.dart';
import 'package:sea_hr/views/drawer/dialog_select_company.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ThemeApp.light().primaryColor,
            ),
            child: const Row(
              children: [
                _ImageUser(),
                Expanded(
                  child: _NameDrawer(),
                )
              ],
            ),
          ),
          const Expanded(child: _Body()),
          const _ButtonLogout(),
        ],
      ),
    );
  }
}

class _ImageUser extends StatelessWidget {
  const _ImageUser();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Obx(
      () => Container(
        height: 60,
        width: 60,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        ),
        child: homeController.user.value.image == null ||
                homeController.user.value.image == ""
            ? Container(
                height: 120,
                width: 120,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/avatar.png"),
                  ),
                ),
              )
            : Image.memory(
                base64Decode(homeController.user.value.image ?? ""),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.person,
                    size: 20,
                  );
                },
              ),
      ),
    );
  }
}

class _NameDrawer extends StatelessWidget {
  const _NameDrawer();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Obx(() => Text(
            homeController.user.value.name ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  offset: Offset(1.0, 1.0),
                  blurRadius: 1.0,
                  color: Colors.black87,
                ),
              ],
            ),
          )),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Material(
      color: Colors.transparent,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: Obx(
              () => Text(
                "Công ty: ${homeController.companyUser.value.shortName}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            // leading: const Icon(Icons.business),
            onTap: () {
              if (homeController.companiesOfU.isNotEmpty &&
                  homeController.companiesOfU[0].id != 0) {
                Get.bottomSheet(const DialogSelectCompany());
              }
            },
          ),
          // ListTile(
          //   title: const Text(
          //     "Đánh giá nhân sự",
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(fontSize: 16),
          //   ),
          //   leading: Image.asset(
          //     "assets/images/icon_appraisal.png",
          //     height: 40,
          //     width: 40,
          //   ),
          //   onTap: () {
          //     Get.toNamed("/appraisal");
          //   },
          // ),
          // ListTile(
          //   title: const Text(
          //     "Trình ký",
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(fontSize: 16),
          //   ),
          //   leading: Image.asset(
          //     "assets/images/icon_sign.png",
          //     height: 40,
          //     width: 40,
          //   ),
          //   onTap: () {
          //     Get.toNamed("/sign");
          //   },
          // ),
          // ListTile(
          //   title: const Text(
          //     "Chấm công",
          //     maxLines: 1,
          //     overflow: TextOverflow.ellipsis,
          //     style: TextStyle(fontSize: 16),
          //   ),
          //   leading: Image.asset(
          //     "assets/images/icon_attendance.png",
          //     height: 40,
          //     width: 40,
          //   ),
          //   onTap: () {
          //     Get.toNamed("/attendance");
          //   },
          // ),
        ],
      ),
    );
  }
}

class _ButtonLogout extends StatelessWidget {
  const _ButtonLogout();

  @override
  Widget build(BuildContext context) {
    MainController mainController = Get.find<MainController>();
    return Material(
      color: Colors.transparent,
      child: ListTile(
        title: const Text(
          "Đăng xuất",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16),
        ),
        leading: const Icon(Icons.logout_rounded),
        onTap: () {
          Get.dialog(
            AlertDialog(
              title: const Text("Xác nhận"),
              content: const Text("Bạn có muốn đăng xuất?"),
              actions: [
                TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text("Hủy")),
                TextButton(
                    onPressed: () async {
                      await mainController.logout();
                    },
                    child: const Text(
                      "Đăng xuất",
                      style: TextStyle(color: Colors.red),
                    )),
              ],
            ),
          );
        },
        iconColor: Colors.red,
        textColor: Colors.red,
      ),
    );
  }
}
