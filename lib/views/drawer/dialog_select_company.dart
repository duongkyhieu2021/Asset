import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/modules/res_company/respository/company.dart';

class DialogSelectCompany extends StatelessWidget {
  const DialogSelectCompany({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find<HomeController>();
    return Card(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              "Chọn công ty",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeController.companiesOfU.length,
                itemBuilder: (context, index) {
                  return _ItemMenu(
                      company: homeController.companiesOfU[index],
                      homeController: homeController);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _ItemMenu extends StatelessWidget {
  final Company company;
  final HomeController homeController;
  const _ItemMenu({required this.company, required this.homeController});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          homeController.changeCompany(company.id);
        },
        child: Container(
          height: 40,
          margin: const EdgeInsets.all(5),
          child: Center(
            child: Text(
              company.shortName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
