import 'dart:developer';

//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/modules/hr_employee/respository/employee.dart';

class EmployeeRepository extends OdooRepository<EmployeeMulti> {
  @override
  final String modelName = 'hr.employee.multi.company';

  EmployeeRepository(OdooEnvironment env) : super(env);

  @override
  EmployeeMulti createRecordFromJson(Map<String, dynamic> json) {
    return EmployeeMulti.fromJson(json);
  }

  @override
  Future<List<dynamic>> searchRead() async {
    try {
      List<dynamic> res = await env.orpc.callKw({
        'model': modelName,
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [
            // ['employee_current_status', '!=', 'resigned']
          ],
          'fields': EmployeeMulti.oFields,
        },
      });
      // for (var e in res) {
      //   log("$e");
      // }
      return res;
    } catch (e) {
      log("$e", name: "employee_repo - searchRead");
      return [];
    }
  }

  Future<List<dynamic>> handleGetEmployeeBasedOnUserId(int userId) async {
    try {
      List<dynamic> res = await env.orpc.callKw({
        'model': modelName,
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [
            ['user_id', '=', userId]
          ],
          'fields': EmployeeMulti.oFields,
        },
      });
      return res;
    } catch (e) {
      log("$e", name: "employee_repo - handleGetEmployeeBasedOnUserId");
      return [];
    }
  }

  Future<List<dynamic>> handleGetEmployeeBasedOnDepartmentId(
      int departmentId) async {
    try {
      List<dynamic> res = await env.orpc.callKw({
        'model': modelName,
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [
            ['department_id', 'child_of', departmentId]
          ],
          'fields': EmployeeMulti.oFields,
        },
      });
      print(res);
      return res;
    } catch (e) {
      log("$e", name: "employee_repo - handleGetEmployeeBasedOnDepartmentId");
      return [];
    }
  }

  Future<List<dynamic>> handleGetEmployeeBarCodeBasedOUserId(int userId) async {
    try {
      List<dynamic> res = await env.orpc.callKw({
        'model': 'hr.employee',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'domain': [
            ['user_id', '=', userId]
          ],
          'fields': ["barcode"],
        },
      });
      return res;
    } catch (e) {
      log("$e", name: "employee_repo - handleGetEmployeeBarCodeBasedOUserId");
      return [];
    }
  }
}

// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:odoo_rpc/odoo_rpc.dart';
// import 'package:sea_hr/controllers/main_controller.dart';
// import 'package:sea_hr/objects/user.dart';

// class EmployeeService {
//   Future<void> getEmployeeOdoo() async {
//     MainController mainController = Get.find<MainController>();
//     OdooClient odooClient = mainController.env.orpc;
//     int result = 0;
//     try {
//       await odooClient.checkSession().timeout(const Duration(seconds: 5));
//       User? user;
//       if (user != null) {
//         List<dynamic> res = await odooClient.callKw({
//           'model': 'hr.employee',
//           'method': 'search_read',
//           'args': [],
//           'kwargs': {
//             'domain': [
//               ['user_id', '=', user.id]
//             ],
//             'fields': [
//               'id',
//               'name',
//               'spouse_birthdate',
//               's_identification_id',
//               'country_id',
//               'ethnicity',
//               'religion',
//               'bank_id',
//               'acc_number',
//               'acc_holder_name',
//               'sea_personal_email',
//               'main_phone_number',
//               'second_phone_number',
//               'sea_permanent_addr',
//               'permanent_country_id',
//               'permanent_city_id',
//               'permanent_district_id',
//               'sea_temp_addr',
//               'temporary_country_id',
//               'temporary_city_id',
//               'temporary_district_id',
//               'identification_id',
//               'sea_id_issue_date',
//               'id_issue_place',
//               'id_expiry_date',
//               'id_attachment_id',
//               'passport_id',
//               'sea_passport_issue_date',
//               'sea_passport_issue_place',
//               'passport_expiry_date',
//               'address_home_id',
//               'emergency_contact',
//               'emergency_phone',
//               'km_home_work',
//               'gender',
//               'marital',
//               'spouse_complete_name',
//               'spouse_birthdate',
//               'birthday',
//               'children',
//               'place_of_birth',
//               'country_of_birth',
//               'visa_no',
//               'permit_no',
//               'visa_expire',
//               'certificate',
//               'study_field',
//               'study_school',
//               'additional_note',
//               'fam_ids',
//               'extra_note',
//               'image',
//             ],
//           },
//         });
//         log("$res");
//         // if (res.isNotEmpty) {
//         //   Employee employee = Employee.fromJson(res[0]);
//         //   employee.image = "";
//         //   log("${employee.toJson()}");
//         // }
//       } else {
//         Fluttertoast.showToast(msg: "Không tìm thấy người dùng");
//         Get.offAndToNamed("/login");
//       }

//       result = 1;
//     } catch (e) {
//       if (e.toString().contains("Odoo Session Expired")) {
//         result = 2;
//         log("Hết phiên đăng nhập!", name: "GET EMPLOYEE");
//         Get.offAndToNamed("/login");
//       } else {
//         result = 0;
//         log("$e", name: "GET EMPLOYEE");
//       }
//     }
//   }
// }

