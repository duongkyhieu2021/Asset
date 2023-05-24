import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sea_hr/controllers/home_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/controller/account_assset_asset_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/account_asset_asset_record.dart';
import 'package:sea_hr/widgets/bottom_navigator_bar.dart';

class AccountAssetPage extends StatelessWidget {
  const AccountAssetPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    HomeController homeController = Get.put(HomeController());
    AccountAssetController asssetController = Get.put(AccountAssetController());
    var receivedArguments = Get.arguments;
    var asset = receivedArguments != null ? receivedArguments[0] : null;

    return Obx(() {
      return asssetController.status.value == 1
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                title: const Text("Thông tin tài sản"),
              ),
              bottomNavigationBar: homeController.status.value == 1
                  ? null
                  : const BottomNavigatorAppBar(),
              body: asset != null
                  ? Body(
                      asset: asset,
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            );
    });
  }
}

class Body extends StatelessWidget {
  final AccountAssetAssetRecord asset;

  const Body({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoRow(
                  title: 'Công ty sở hữu:',
                  value: asset.companyId?.isNotEmpty ?? false
                      ? asset.companyId![1]
                      : '',
                ),
                _buildInfoRow(
                  title: 'Phòng ban sử dụng:',
                  value: asset.managementDept?.isNotEmpty ?? false
                      ? asset.managementDept![1]
                      : '',
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Mã tài sản:',
                        value: asset.code ?? '',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Tên tài sản:',
                        value: asset.name ?? '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Số lượng:',
                        value: asset.quantity.toString(),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Loại tài sản:',
                        value: asset.assetType?.isNotEmpty ?? false
                            ? asset.assetType![1]
                            : '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Danh mục tài sản:',
                        value: asset.categoryId?.isNotEmpty ?? false
                            ? asset.categoryId![1]
                            : '',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Đơn vị tính:',
                        value: asset.assetUom?.isNotEmpty ?? false
                            ? asset.assetUom![1]
                            : '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Địa điểm:',
                        value: asset.seaOfficeId?.isNotEmpty ?? false
                            ? asset.seaOfficeId![1]
                            : '',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Người sử dụng:',
                        value: asset.assetUser?.isNotEmpty ?? false
                            ? asset.assetUser![1]
                            : '',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Ngày bắt đầu khấu hao:',
                        value: asset.dateFirstDepreciation ?? '',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _buildInfoRow(
                        title: 'Ngày khấu hao đầu tiên:',
                        value: asset.firstDepreciationManualDate ?? '',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow({required String title, required String value}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
