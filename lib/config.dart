import 'dart:convert';

import 'package:crypto/crypto.dart';

class Config {
  static String odooServerURL = "https://test.seateklab.vn/";
  static String odooDbName = "Test_280423";
  // static String odooServerURL = "http://10.0.54.89:8069/";
  // static String odooDbName = "opensea12pro25";
  static String storageUser = "user";

  static String hiveBoxName = sha1
      .convert(utf8.encode('odoo_repository_demo:$odooServerURL:$odooDbName'))
      .toString();
  static String cacheSessionKey = 'session';

  static double userInfoCalendarHeight = 65.0;
}
