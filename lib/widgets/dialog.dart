import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> dialogComfirm(String message, Function accept) async {
  await Get.dialog(AlertDialog(
    title: const Text("Xác nhận"),
    content: Text(message),
    actions: [
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Hủy")),
      TextButton(
          onPressed: () async {
            await accept();
            Get.back();
          },
          child: const Text("Đồng ý"))
    ],
  ));
}
