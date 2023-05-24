import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/modules/res_company/respository/company.dart';
import 'package:sea_hr/theme.dart';
import 'package:sea_hr/widgets/dialog_progress.dart';

class MenuUser extends StatelessWidget {
  const MenuUser({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const _Logo(),
          const _Image(),
          const _SelectCompany(),
          const SizedBox(height: 100),
          Container(height: 0.5, color: Colors.grey),
          const _Logout(),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(4),
          width: 40,
          height: 40,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.close_rounded),
          ),
        ),
        Expanded(
          child: Image.asset(
            "assets/images/logo_seacorp.png",
            height: 40,
          ),
        ),
        const SizedBox(height: 40, width: 40)
      ],
    );
  }
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Obx(
            () => Container(
              height: 50,
              width: 50,
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
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${homeController.user.value.name}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: ThemeApp.textStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "${homeController.user.value.login}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        )
      ],
    );
  }
}

class _SelectCompany extends StatelessWidget {
  const _SelectCompany();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    List<Company> companys = homeController.companiesOfU;
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              buttonPadding: const EdgeInsets.symmetric(horizontal: 10),
              buttonWidth: double.infinity,
              value: homeController.companyUser.value,
              items: [
                ...companys.map(
                  (e) {
                    return DropdownMenuItem<Company>(
                      value: e,
                      child: Text(
                        e.shortName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                ),
              ],
              onChanged: (value) {
                if (value != null &&
                    value.id != 0 &&
                    value != homeController.companyUser.value) {
                  Get.dialog(AlertDialog(
                    title: const Text("Xác nhận"),
                    content: const Text("Bạn có muốn đổi công ty?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Hủy")),
                      TextButton(
                          onPressed: () async {
                            Get.dialog(const DialogProgress(title: "Đang đổi"));
                            int result =
                                await homeController.changeCompany(value.id);
                            if (result == 1) {
                              Get.back();
                              Get.back();
                              Fluttertoast.showToast(msg: "Thành công!");
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Lỗi, vui lòng thử lại");
                              Get.back();
                              Get.back();
                            }
                          },
                          child: const Text("Đồng ý")),
                    ],
                  ));
                }
              },
            ),
          ),
        ),
      );
    });
  }
}

class _Logout extends StatelessWidget {
  const _Logout();

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                  await Get.find<MainController>().logout();
                },
                child: const Text(
                  "Đăng xuất",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(12),
        child: Row(
          children: [
            const Icon(
              Icons.logout_rounded,
              color: Colors.red,
            ),
            Text(
              "Đăng xuất",
              style: ThemeApp.textStyle(
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
