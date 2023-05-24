import 'package:equatable/equatable.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';
import 'package:sea_hr/modules/account_asset_asset/repository/asset_inventory_repos.dart';

class AssetInventoryRecord extends Equatable implements OdooRecord {
  @override
  final int id;

  String? name;
  DateTime? startTime;
  DateTime? endTime;
  List<dynamic>? companyId;
  List<dynamic>? department;
  List<dynamic>? seaOfficeId;

  AssetInventoryRecord({
    required this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.companyId,
    this.department,
    this.seaOfficeId,
  });

  factory AssetInventoryRecord.initAssetInventory() {
    return AssetInventoryRecord(
        id: 0,
        name: "",
        startTime: DateTime.now(),
        endTime: DateTime.now(),
        companyId: const [],
        department: const [],
        seaOfficeId: const []);
  }

  @override
  List<Object?> get props => [
        id,
        name,
        startTime,
        endTime,
        companyId,
        department,
        seaOfficeId,
      ];

  static AssetInventoryRecord fromJson(Map<String, dynamic> json) {
    return AssetInventoryRecord(
      id: json['id'],
      name: json['name'] == false ? '' : json['name'],
      startTime: json['start_time'] == false
          ? DateTime.now()
          : DateTime.parse(json['start_time']),
      endTime: json['end_time'] == false
          ? DateTime.now()
          : DateTime.parse(json['end_time']),
      companyId: json['company_id'] == false ? [] : json['company_id'],
      department: json['department'] == false ? [] : json['department'],
      seaOfficeId: json['sea_office_id'] == false ? [] : json['sea_office_id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_time': startTime.toString(),
      'end_time': endTime.toString(),
      'company_id': companyId,
      'department': department,
      'sea_office_id': seaOfficeId,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      'id': id,
      'name': name,
      'start_time': startTime.toString(),
      'end_time': endTime.toString(),
      'company_id': companyId!.isEmpty ? false : companyId?[0],
      'department': department!.isEmpty ? false : department?[0],
      'sea_office_id': seaOfficeId!.isEmpty ? false : seaOfficeId?[0],
    };
  }

  static List<String> get oFields => [
        'id',
        'name',
        'start_time',
        'end_time',
        'company_id',
        'department',
        'sea_office_id',
      ];
}
