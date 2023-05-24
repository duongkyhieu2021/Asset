import 'dart:developer';

import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_record.dart';

class AssetInventoryRepository extends OdooRepository<AssetInventoryRecord> {
  @override
  final String modelName = 'asset.inventory';
  AssetInventoryRepository(OdooEnvironment env) : super(env);

  @override
  AssetInventoryRecord createRecordFromJson(Map<String, dynamic> json) {
    return AssetInventoryRecord.fromJson(json);
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
          'fields': AssetInventoryRecord.oFields,
        },
      });

      return res;
    } catch (e) {
      log("$e", name: "AssetInventoryRepository - searchRead");
      return [];
    }
  }
}
