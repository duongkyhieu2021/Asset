import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/models/validate.dart';
import 'package:sea_hr/modules/res_user/respository/user_repository.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> controllerUsername = TextEditingController().obs;
  Rx<TextEditingController> controllerPassword = TextEditingController().obs;
  RxBool isInvisibilityPass = true.obs;

  Rx<RoundedLoadingButtonController> buttonLoginController =
      RoundedLoadingButtonController().obs;

  RxString username = "SC021000670".obs;
  RxString password = "H123456".obs;

  Future<void> login() async {
    if (Validate.usernameValid(username.value) &&
        Validate.passwordValid(password.value)) {
      int result = await UserRepository(Get.find<MainController>().env)
          .authenticateUser(login: username.value, password: password.value);

      switch (result) {
        case 0:
          buttonLoginController.value.error();
          await Future.delayed(const Duration(milliseconds: 1000));
          buttonLoginController.value.reset();
          break;
        case 1:
          buttonLoginController.value.success();
          await Future.delayed(const Duration(milliseconds: 2000));
          Get.find<MainController>().currentIndexOfNavigatorBottom.value = 0;
          Get.offAllNamed("/home");
          break;
        case 2:
          buttonLoginController.value.error();
          Fluttertoast.showToast(msg: "Không thể kết nối server!");
          await Future.delayed(const Duration(milliseconds: 1000));
          buttonLoginController.value.reset();
          break;
      }
    } else {
      buttonLoginController.value.error();
      await Future.delayed(const Duration(milliseconds: 1000));
      buttonLoginController.value.reset();
    }
  }
}
