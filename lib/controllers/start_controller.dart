import 'package:get/get.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/modules/res_user/respository/user_repository.dart';

class StartController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    MainController mainController = Get.find<MainController>();
    await mainController.init();

    int result = await UserRepository(mainController.env).checkSession();

    if (result == 1) {
      await Future.delayed(const Duration(milliseconds: 1000));
      Get.offAndToNamed("/home");
    } else {
      await Future.delayed(const Duration(milliseconds: 1000));
      Get.offAndToNamed("/login");
    }
  }
}
