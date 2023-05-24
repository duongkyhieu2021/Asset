import 'dart:io';

import 'package:hive/hive.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
//import 'package:odoo_rpc/odoo_rpc.dart';
import 'package:sea_hr/OdooRepository/OdooRpc/odoo_rpc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sea_hr/config.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/account_asset_asset_record.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_committee_record.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_record.dart';
import 'package:sea_hr/modules/res_company/respository/company.dart';
import 'package:sea_hr/modules/hr_employee/respository/employee.dart';
import 'package:sea_hr/modules/hr_job/respository/hr_job.dart';

import 'package:sea_hr/modules/res_user/respository/user.dart';
import 'package:sea_hr/modules/sea_office/sea_office.dart';

//dkh ++

typedef SessionChangedCallback = void Function(OdooSession sessionId);

/// Implements persistent key-value storage for
/// Odoo records and session persistance with Hive
class OdooKvHive implements OdooKv {
  late Box box;

  OdooKvHive();

  @override
  Future<void> init() async {
    Hive.registerAdapter(OdooSessionAdapter());
    Hive.registerAdapter(OdooRpcCallAdapter());
    Hive.registerAdapter(OdooIdAdapter());
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(CompanyAdapter());

    Hive.registerAdapter(EmployeeMultiAdapter());
    Hive.registerAdapter(HrJobAdapter());
    Hive.registerAdapter(AccountAssetAssetAdapter());
    Hive.registerAdapter(AssetInventoryAdapter());
    Hive.registerAdapter(AssetInventoryCommitteeAdapter());
    Hive.registerAdapter(SeaOfficeAdapter());

    Directory? directory = await getExternalStorageDirectory();
    Hive.init("${directory?.path}/odooHive");
    box = await Hive.openBox(Config.hiveBoxName);
  }

  @override
  Future<void> close() {
    return box.close();
  }

  @override
  dynamic get(dynamic key, {dynamic defaultValue}) {
    return box.get(key, defaultValue: defaultValue);
  }

  @override
  Future<void> put(dynamic key, dynamic value) {
    return box.put(key, value);
  }

  @override
  Future<void> delete(dynamic key) {
    return box.delete(key);
  }

  @override
  Iterable<dynamic> get keys => box.keys;
}

/// Callback for session changed events
SessionChangedCallback storeSesion(OdooKv cache) {
  void sessionChanged(OdooSession sessionId) {
    if (sessionId.id == '') {
      cache.delete(Config.cacheSessionKey);
    } else {
      cache.put(Config.cacheSessionKey, sessionId);
    }
  }

  return sessionChanged;
}

/// Adapter to store and read OdooSession from persistent storage
class OdooSessionAdapter extends TypeAdapter<OdooSession> {
  @override
  final typeId = 0;

  @override
  OdooSession read(BinaryReader reader) {
    return OdooSession.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, OdooSession obj) {
    writer.write(obj.toJson());
  }
}

/// Adapter to store and read OdooRpcCall to/from Hive
class OdooRpcCallAdapter extends TypeAdapter<OdooRpcCall> {
  @override
  final typeId = 2;

  @override
  OdooRpcCall read(BinaryReader reader) {
    return OdooRpcCall.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, OdooRpcCall obj) {
    writer.write(obj.toJson());
  }
}

/// Adapter to store and read OdooId to/from Hive
class OdooIdAdapter extends TypeAdapter<OdooId> {
  @override
  final typeId = 3;

  @override
  OdooId read(BinaryReader reader) {
    return OdooId.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, OdooId obj) {
    writer.write(obj.toJson());
  }
}

class UserAdapter extends TypeAdapter<User> {
  @override
  final typeId = 4;

  @override
  User read(BinaryReader reader) {
    return User.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.write(obj.toJson());
  }
}

class CompanyAdapter extends TypeAdapter<Company> {
  @override
  final typeId = 5;

  @override
  Company read(BinaryReader reader) {
    return Company.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, Company obj) {
    writer.write(obj.toJson());
  }
}

class EmployeeMultiAdapter extends TypeAdapter<EmployeeMulti> {
  @override
  int get typeId => 9;

  @override
  EmployeeMulti read(BinaryReader reader) {
    return EmployeeMulti.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, EmployeeMulti obj) {
    writer.write(obj.toJson());
  }
}

class HrJobAdapter extends TypeAdapter<HrJob> {
  @override
  int get typeId => 10;

  @override
  HrJob read(BinaryReader reader) {
    return HrJob.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, HrJob obj) {
    writer.write(obj.toJson());
  }
}

class AccountAssetAssetAdapter extends TypeAdapter<AccountAssetAssetRecord> {
  @override
  int get typeId => 11;

  @override
  AccountAssetAssetRecord read(BinaryReader reader) {
    return AccountAssetAssetRecord.fromJson(
        Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, AccountAssetAssetRecord obj) {
    writer.write(obj.toJson());
  }
}

class AssetInventoryAdapter extends TypeAdapter<AssetInventoryRecord> {
  @override
  int get typeId => 12;

  @override
  AssetInventoryRecord read(BinaryReader reader) {
    return AssetInventoryRecord.fromJson(
        Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, AssetInventoryRecord obj) {
    writer.write(obj.toJson());
  }
}

class AssetInventoryCommitteeAdapter
    extends TypeAdapter<AssetInventoryCommitteeRecord> {
  @override
  int get typeId => 13;

  @override
  AssetInventoryCommitteeRecord read(BinaryReader reader) {
    return AssetInventoryCommitteeRecord.fromJson(
        Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, AssetInventoryCommitteeRecord obj) {
    writer.write(obj.toJson());
  }
}

class SeaOfficeAdapter extends TypeAdapter<SeaOffice> {
  @override
  int get typeId => 14;

  @override
  SeaOffice read(BinaryReader reader) {
    return SeaOffice.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, SeaOffice obj) {
    writer.write(obj.toJson());
  }
}
