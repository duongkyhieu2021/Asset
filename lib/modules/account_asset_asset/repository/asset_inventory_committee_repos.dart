import 'dart:developer';

import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_committee_record.dart';

class AssetInventoryCommitteeRepository
    extends OdooRepository<AssetInventoryCommitteeRecord> {
  @override
  final String modelName = 'asset.inventory.committee';
  AssetInventoryCommitteeRepository(OdooEnvironment env) : super(env);

  @override
  AssetInventoryCommitteeRecord createRecordFromJson(
      Map<String, dynamic> json) {
    return AssetInventoryCommitteeRecord.fromJson(json);
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
          'fields': AssetInventoryCommitteeRecord.oFields,
        },
      });
      // print(res);
      return res;
    } catch (e) {
      log("$e", name: "AssetInventoryCommitteeRepository - searchRead");
      return [];
    }
  }
}
