import 'package:get/get.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
//import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:sea_hr/OdooRepository/OdooRpc/odoo_rpc.dart';
import 'package:sea_hr/config.dart';
import 'package:sea_hr/models/network_connect.dart';
import 'package:sea_hr/models/odoo_kv_hive_impl.dart';
import 'package:sea_hr/modules/res_company/respository/company_repository.dart';
import 'package:sea_hr/modules/hr_employee/respository/employee_repo.dart';
import 'package:sea_hr/modules/hr_job/respository/hr_job_repository.dart';
import 'package:sea_hr/modules/res_user/respository/user_repository.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  OdooKvHive cache = OdooKvHive();
  NetworkConnectivity netConn = NetworkConnectivity();
  late OdooEnvironment env;

  RxInt currentIndexOfNavigatorBottom = 0.obs;

  Future<void> logout() async {
    UserRepository(env).logOutUser();
    cache.delete(Config.cacheSessionKey);
    Get.offAllNamed("/login");
    currentIndexOfNavigatorBottom.value = 0;
  }

  Future init() async {
    await cache.init();
    OdooSession? session =
        cache.get(Config.cacheSessionKey, defaultValue: null);

    env = OdooEnvironment(OdooClient(Config.odooServerURL, session),
        Config.odooDbName, cache, netConn);

    env.add(UserRepository(env));
    env.add(CompanyRepository(env));
    env.add(EmployeeRepository(env));
    env.add(HrJobRepository(env));

    update();
  }
}
