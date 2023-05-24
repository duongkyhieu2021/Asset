import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../modules/account_asset_asset/views/account_asset_asset/account_asset_search_view.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: Get.size.height * 1 -
          kBottomNavigationBarHeight -
          kToolbarHeight * 1.5,
      child: const AccountAssetSearchPage(),
    ));
  }
}
