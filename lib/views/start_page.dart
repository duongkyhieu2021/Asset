import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/start_controller.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    Get.put(StartController());
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(50),
            child: Image.asset("assets/images/logo_seacorp.png"),
          ),
        ),
      ),
    );
  }
}
