import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/controller/asset_inventory_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/views/asset_inventory/widgets/asset_inventory_committee_view.dart';
import 'package:sea_hr/widgets/input_widget.dart';
import 'package:sea_hr/widgets/date_time_picker_custom.dart';
import 'package:sea_hr/widgets/dropdown_button2_widget.dart';

class AssetInventoryGeneralView extends StatefulWidget {
  const AssetInventoryGeneralView({Key? key}) : super(key: key);

  @override
  State<AssetInventoryGeneralView> createState() =>
      _AssetInventoryGeneralViewState();
}

class _AssetInventoryGeneralViewState extends State<AssetInventoryGeneralView> {
  String? _selectedValueDepartment;
  String? _selectedValueLocation;

  @override
  void initState() {
    final assetInventoryController = Get.put(AssetInventoryController());
    final homeController = Get.put(HomeController());
    assetInventoryController.currentInventory.value.companyId = [
      homeController.companyUser.value.id,
      homeController.companyUser.value.name,
      homeController.companyUser.value.shortName
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assetInventoryController = Get.put(AssetInventoryController());
    final homeController = Get.put(HomeController());

    return Obx(() => ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: Column(
                children: [
                  _buildNameInput(assetInventoryController),
                  _buildCompanyInput(homeController, assetInventoryController),
                  _buildDepartmentDropdown(assetInventoryController),
                  _buildLocationDropdown(assetInventoryController),
                  _buildStartTimePicker(assetInventoryController),
                  _buildEndTimePicker(assetInventoryController),
                  _buildAssetInventoryCommittee()
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildNameInput(AssetInventoryController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputWidget(
        onSaved: (value) {},
        onChange: (value) {
          controller.currentInventory.value.name = value;
        },
        validator: (value) => null,
        initialValue: controller.assetInventory.value.name!.isNotEmpty
            ? controller.assetInventory.value.name
            : "",
      ),
    );
  }

  Widget _buildCompanyInput(
      HomeController controllerHome, AssetInventoryController controllerAsset) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InputWidget(
        onSaved: (value) => {},
        onChange: (value) {},
        validator: (value) => null,
        initialValue: controllerHome.companyUser.value.id.toString().isNotEmpty
            ? controllerHome.companyUser.value.name
            : "",
        isDisabled: true,
      ),
    );
  }

  Widget _buildDepartmentDropdown(AssetInventoryController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton2Widget(
        hintText: controller.assetInventory.value.department!.isEmpty
            ? "Chọn bộ phận"
            : controller.assetInventory.value.department?[1],
        items: controller.listDepartment
            .toList()
            .map((department) => {
                  'id': department.id,
                  'name': department.name,
                })
            .toList(),
        value: _selectedValueDepartment,
        onChanged: (value) {
          setState(() {
            _selectedValueDepartment = value;
          });

          // Lấy deparment hiện có nếu update
          List<dynamic>? departments =
              controller.assetInventory.value.department!.isEmpty
                  ? []
                  : controller.assetInventory.value.department;
          departments = controller.listDepartment
              .where((element) => element.id == int.parse(value!))
              .map((element) => element.departmentId)
              .toList();

          controller.currentInventory.value.department = departments[0];
        },
      ),
    );
  }

  Widget _buildLocationDropdown(AssetInventoryController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton2Widget(
        hintText: controller.assetInventory.value.seaOfficeId!.isEmpty
            ? "Chọn địa điểm"
            : controller.assetInventory.value.seaOfficeId![1],
        items: controller.listSeaOffice
            .map((seaoffice) => {
                  'id': seaoffice.id,
                  'name': seaoffice.name,
                })
            .toList(),
        value: _selectedValueLocation,
        onChanged: (value) {
          setState(() {
            _selectedValueLocation = value;
          });
          // Lấy location hiện có nếu update
          List<dynamic>? locations =
              controller.assetInventory.value.department!.isEmpty
                  ? []
                  : controller.assetInventory.value.department;
          locations = controller.listSeaOffice
              .where((element) => element.id == int.parse(value!))
              .map((element) => [element.id, element.name, element.address])
              .toList();

          controller.currentInventory.value.seaOfficeId = locations[0];
        },
      ),
    );
  }

  Widget _buildStartTimePicker(AssetInventoryController controller) {
    print("start time ${controller.assetInventory.value.startTime}");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DateTimePickerCustom(
        buttonText: controller.assetInventory.value.startTime != null
            ? controller.assetInventory.value.startTime.toString()
            : "Ngày bắt đầu",
        onDateTimeChanged: (dateTime) {
          controller.currentInventory.value.startTime = dateTime;
        },
      ),
    );
  }

  Widget _buildEndTimePicker(AssetInventoryController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DateTimePickerCustom(
        buttonText: controller.assetInventory.value.endTime != null
            ? controller.assetInventory.value.endTime.toString()
            : "Ngày kết thúc",
        onDateTimeChanged: (dateTime) {
          controller.currentInventory.value.endTime = dateTime;
        },
      ),
    );
  }

  Widget _buildAssetInventoryCommittee() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: AssetInventoryCommitteeView(),
    );
  }
}
