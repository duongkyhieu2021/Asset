import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sea_hr/controllers/main_controller.dart';
import 'package:sea_hr/modules/account_asset_asset/views/account_asset_asset/account_asset_asset_info_view.dart';
import 'package:sea_hr/modules/account_asset_asset/views/asset_inventory/asset_inventory_info_view.dart';
import 'package:sea_hr/modules/account_asset_asset/views/asset_inventory/asset_inventory_view.dart';
import 'package:sea_hr/theme.dart';
import 'package:sea_hr/views/home/home.dart';

import 'package:sea_hr/views/login_page.dart';
import 'package:sea_hr/views/start_page.dart';
import 'package:sea_hr/views/feature_list/feature_list.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init();
  Get.config(
    enableLog: false,
    defaultTransition: Transition.native,
  );
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(Phoenix(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return GetMaterialApp(
      // localizationsDelegates: const [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   SfGlobalLocalizations.delegate
      // ],
      // supportedLocales: const [
      //   Locale('vi'),
      //   Locale('en'),
      //   Locale('fr'),
      // ],
      // locale: const Locale('vi'),
      debugShowCheckedModeBanner: false,
      enableLog: false,
      theme: ThemeApp.light(),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const StartPage(),
        ),
        GetPage(
            name: "/login",
            page: () => const LoginPage(),
            transition: Transition.noTransition),
        GetPage(
            name: "/home",
            page: () => const Home(),
            transition: Transition.noTransition),
        // GetPage(
        //     name: "/sea_sign_view",
        //     page: () => const AccountAssetSearchPage(),
        //     transition: Transition.noTransition),

        // ---------------------------

        /// --------------------------
        GetPage(
            name: "/feature_list",
            page: () => const FeatureListPage(),
            transition: Transition.noTransition),
        GetPage(
            name: "/asset_inventory",
            page: () => const AssetInventoryView(),
            transition: Transition.noTransition),
        GetPage(
          name: "/account_asset_info",
          page: () => const AccountAssetPage(),
        ),
        GetPage(
          name: "/asset_inventory_info",
          page: () => const AssetInventoryInfoView(isCreate: false),
        ),
        GetPage(
          name: "/asset_inventory_info_create",
          page: () => const AssetInventoryInfoView(isCreate: true),
        ),
      ],
    );
  }
}
