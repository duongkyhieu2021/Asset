import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/widgets/menu_user.dart';

class MyAppBar extends StatelessWidget {
  final Widget? child;
  final VoidCallback? onTap;
  const MyAppBar({
    super.key,
    this.child,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Container(
            child: Row(
              children: [
                IconButton(
                  onPressed: onTap,
                  icon: const Icon(Icons.menu),
                ),
                Expanded(
                  flex: 5,
                  child: child ?? const SizedBox(),
                ),
                const _ImageUser(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ImageUser extends StatelessWidget {
  const _ImageUser();

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return SizedBox(
      height: 40,
      width: 40,
      child: InkWell(
        onTap: () {
          Get.dialog(
            const Dialog(
              child: MenuUser(),
            ),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: Container(
          margin: const EdgeInsets.all(4),
          height: 35,
          width: 35,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Obx(() => Image.memory(
                base64Decode(homeController.user.value.image ?? ""),
                fit: BoxFit.cover,
                height: 35,
                width: 35,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    "assets/images/avatar.png",
                    height: 35,
                    width: 35,
                  );
                },
              )),
        ),
      ),
    );
  }
}
