import 'dart:developer';

//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/modules/hr_job/respository/hr_job.dart';

class HrJobRepository extends OdooRepository<HrJob> {
  @override
  final String modelName = 'hr.job';

  HrJobRepository(OdooEnvironment env) : super(env);

  @override
  HrJob createRecordFromJson(Map<String, dynamic> json) {
    return HrJob.fromJson(json);
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
          'fields': HrJob.oFields,
        },
      });
      // for (var e in res) {
      //   log("$e");
      // }
      return res;
    } catch (e) {
      log("$e", name: "hrjob_repo - searchRead");
      return [];
    }
  }
}
