import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

import 'package:sea_hr/modules/account_asset_asset/repository/account_asset_asset_record.dart';

import '../../../../theme.dart';
import '../../../../widgets/list_empty.dart';
import '../../controller/account_assset_asset_controller.dart';

class AccountAssetSearchPage extends StatelessWidget {
  const AccountAssetSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    AccountAssetController asssetController = Get.put(AccountAssetController());
    return Obx(() {
      return asssetController.status.value == 1
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : asssetController.listAccountAsset.isEmpty
              ? const Column(
                  children: [
                    _TextFieldSearchCode(),
                    ListEmpty(
                      title: "Không tìm thấy",
                    ),
                  ],
                )
              : const Column(
                  children: [
                    _TextFieldSearchCode(),
                    Expanded(child: _ListAsset()),
                  ],
                );
    });
  }
}

class _TextFieldSearchCode extends StatelessWidget {
  const _TextFieldSearchCode();

  @override
  Widget build(BuildContext context) {
    final accountAssetController = Get.find<AccountAssetController>();

    // Scan barcode
    Future<void> scanBarCode() async {
      final barcode = await FlutterBarcodeScanner.scanBarcode(
        "#000000",
        "Hủy",
        true,
        ScanMode.QR,
      );
      barcode == "-1"
          ? "Chưa quét được barcode"
          : accountAssetController.searchAssetByCode(barcode.toString());
    }

    return Container(
      padding: const EdgeInsets.only(left: 10, bottom: 20, top: 20),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: accountAssetController.searchCodeController.value,
              onChanged: (value) {
                accountAssetController.searchCode.value = value;
              },
              onFieldSubmitted: (value) {
                log("fieldSubmit: ");
                accountAssetController.searchAssetByCode(value.toString());
              },
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: "Input Name Or Code",
                filled: true,
                fillColor: Colors.grey[350],
                prefixIcon: const Icon(
                  Icons.search,
                ),
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[350]!.withOpacity(1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[350]!.withOpacity(1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[350]!.withOpacity(1),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorText: null,
              ),
            ),
          ),
          IconButton(
            onPressed: scanBarCode,
            icon: const Icon(
              Icons.photo_camera_rounded,
              size: 30,
            ),
          )
        ],
      ),
    );
  }
}

class _ListAsset extends StatelessWidget {
  const _ListAsset();

  @override
  Widget build(BuildContext context) {
    AccountAssetController accountAssetController =
        Get.find<AccountAssetController>();

    return Obx(
      () {
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: accountAssetController.listAccountAsset.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                _ItemAsset(
                  asset: accountAssetController.listAccountAsset[index],
                ),
                index != accountAssetController.listAccountAsset.length - 1
                    ? const SizedBox()
                    : const SizedBox(height: 100)
              ],
            );
          },
        );
      },
    );
  }
}

class _ItemAsset extends StatelessWidget {
  final AccountAssetAssetRecord asset;
  const _ItemAsset({
    required this.asset,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed("/account_asset_info", arguments: [asset]);
      },
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey, width: 0.5)),
        ),
        child: Container(
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AssetTitle(title: "${asset.name}"),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _AssetInfo(
                          icon: Icons.person_outline_rounded,
                          name: asset.name?[1] ?? "Không có tên",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AssetTitle extends StatelessWidget {
  final String title;
  const _AssetTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: ThemeApp.textStyle(
          fontWeight: FontWeight.bold, color: const Color(0xff448bc0)),
    );
  }
}

class _AssetInfo extends StatelessWidget {
  final IconData icon;
  final String name;
  final int? maxLine;
  const _AssetInfo({
    required this.icon,
    required this.name,
    this.maxLine,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              name,
              maxLines: maxLine ?? 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}
