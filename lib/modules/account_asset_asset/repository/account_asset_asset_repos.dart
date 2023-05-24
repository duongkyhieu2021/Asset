import 'dart:developer';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/account_asset_asset_record.dart';

class AccountAssetRepository extends OdooRepository<AccountAssetAssetRecord> {
  @override
  final String modelName = 'account.asset.asset';
  AccountAssetRepository(OdooEnvironment env) : super(env);

  @override
  AccountAssetAssetRecord createRecordFromJson(Map<String, dynamic> json) {
    return AccountAssetAssetRecord.fromJson(json);
  }

  @override
  Future<List<dynamic>> searchRead() async {
    try {
      List<dynamic> res = await env.orpc.callKw({
        'model': modelName,
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [],
          'fields': AccountAssetAssetRecord.oFields,
        },
      });

      return res;
    } catch (e) {
      log("$e", name: "AccountAssetRepository - searchRead");
      return [];
    }
  }

  Future<List<dynamic>> handleSearchAssetNameOrCode(String value) async {
    try {
      List<dynamic> res = await env.orpc.callKw({
        'model': modelName,
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [
            '|',
            ['name', 'ilike', '%$value%'],
            ['code', 'ilike', '%$value%'],
          ],
          'fields': AccountAssetAssetRecord.oFields,
        },
      });

      return res;
    } catch (e) {
      log("$e", name: "AccountAssetRepository - handleSearchAssetNameOrCode");
      return [];
    }
  }
}
