import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sea_hr/controllers/login_controller.dart';
import 'package:sea_hr/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return const Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            _Background(),
            _Username(),
            _Password(),
            _ButtonLogin(),
          ],
        ),
      ),
    );
  }
}

class _Background extends StatelessWidget {
  const _Background();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(top: h * 0.2, bottom: 20),
      child: Image.asset("assets/images/logo_seatek.png", width: w * 0.6),
    );
    // return Container(
    //   width: w,
    //   padding: const EdgeInsets.only(top: 24),
    //   child: Card(
    //     margin: EdgeInsets.zero,
    //     // shape: const RoundedRectangleBorder(
    //     //   borderRadius: BorderRadius.only(
    //     //     bottomLeft: Radius.circular(20),
    //     //     bottomRight: Radius.circular(20),
    //     //   ),
    //     // ),
    //     child: Center(
    //       child:
    //     ),
    //   ),
    // );
  }
}

class _Title extends StatelessWidget {
  const _Title();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Text(
          "Đăng nhập",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: ThemeApp.light().primaryColor,
          ),
        ),
      ),
    );
  }
}

class _Username extends StatelessWidget {
  const _Username();

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        controller: loginController.controllerUsername.value,
        onChanged: (value) {
          loginController.username.value = value;
        },
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          hintText: "Tài khoản",
          filled: true,
          fillColor: Colors.grey[350],
          contentPadding:
              const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[350]!.withOpacity(1)),
            borderRadius: BorderRadius.circular(20),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[350]!.withOpacity(1)),
            borderRadius: BorderRadius.circular(20),
          ),
          errorText: null,
        ),
      ),
    );
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();
    return Obx(
      () => Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: TextFormField(
          controller: loginController.controllerPassword.value,
          onChanged: (value) {
            loginController.password.value = value;
          },
          obscureText: loginController.isInvisibilityPass.value,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            hintText: "Mật khẩu",
            filled: true,
            fillColor: Colors.grey[350],
            suffixIcon: IconButton(
                icon: Icon(
                  loginController.isInvisibilityPass.value
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  loginController.isInvisibilityPass.value =
                      !loginController.isInvisibilityPass.value;
                }),
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[350]!.withOpacity(1)),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[350]!.withOpacity(1)),
              borderRadius: BorderRadius.circular(20),
            ),
            errorText: null,
          ),
        ),
      ),
    );
  }
}

class _ButtonLogin extends StatelessWidget {
  const _ButtonLogin();

  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find<LoginController>();
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 0, left: 20, right: 20),
      child: RoundedLoadingButton(
        height: 45,
        width: Get.size.width,
        color: ThemeApp.light().primaryColor,
        successColor: Colors.green.shade700,
        borderRadius: 20,
        controller: loginController.buttonLoginController.value,
        onPressed: () async {
          await loginController.login();
        },
        child: const Text("Đăng nhập",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}
