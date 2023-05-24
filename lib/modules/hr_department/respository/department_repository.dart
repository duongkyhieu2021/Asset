import 'dart:developer';

//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/modules/hr_department/respository/department.dart';

class DepartmentRepository extends OdooRepository<Department> {
  @override
  final String modelName = 'hr.department';
  DepartmentRepository(OdooEnvironment env) : super(env);

  @override
  Department createRecordFromJson(Map<String, dynamic> json) {
    return Department.fromJson(json);
  }

  @override
  Future<List<dynamic>> searchRead() async {
    try {
      int userId = env.orpc.sessionId!.userId;
      List<dynamic> res = await env.orpc.callKw({
        'model': modelName,
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [
            ['user_creator', '=', userId]
          ],
          'fields': Department.oFields,
          'limit': limit,
        },
      });

      return res;
    } catch (e) {
      log("$e", name: "department_repo - searchRead");
      return [];
    }
  }

  Future<List<dynamic>> searchDepartmentsUserInCharge(employeeId) async {
    try {
      List<dynamic> res = await env.orpc.callKw({
        'model': modelName,
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [
            ['manager_ids', 'child_of', employeeId]
          ],
          'fields': Department.oFields,
        },
      });

      return res;
    } catch (e) {
      log("$e", name: "department_repo - searchRead");
      return [];
    }
  }

  Future<List<dynamic>> searchDepartmentByCompanyId(int companyId) async {
    try {
      List<dynamic> res = await env.orpc.callKw({
        'model': "hr.department.temporary",
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [
            ['company_id', '=', companyId]
          ],
          'fields': Department.oFields,
        },
      });

      return res;
    } catch (e) {
      log("$e", name: "department_repo - searchDepartmentByCompanyId");
      return [];
    }
  }
}
