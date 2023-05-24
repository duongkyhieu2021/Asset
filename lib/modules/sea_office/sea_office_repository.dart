import 'dart:developer';

//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/modules/sea_office/sea_office.dart';

class SeaOfficeRepository extends OdooRepository<SeaOffice> {
  @override
  final String modelName = 'sea.office';
  SeaOfficeRepository(OdooEnvironment env) : super(env);

  @override
  SeaOffice createRecordFromJson(Map<String, dynamic> json) {
    return SeaOffice.fromJson(json);
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
          'fields': SeaOffice.oFields,
        },
      });

      return res;
    } catch (e) {
      log("$e", name: "sea_office_repo - searchRead");
      return [];
    }
  }
}
