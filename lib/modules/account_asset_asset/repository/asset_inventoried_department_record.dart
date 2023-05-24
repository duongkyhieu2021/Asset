import 'package:equatable/equatable.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class AssetInventoriedDepartmentRecord extends Equatable implements OdooRecord {
  @override
  final int id;
  final int? employeeIdTemp;
  final int? employeeId;
  final List<dynamic>? department;
  final List<dynamic>? assetInventoryId;
  final bool? active;

  const AssetInventoriedDepartmentRecord({
    required this.id,
    this.employeeIdTemp,
    this.employeeId,
    this.department,
    this.assetInventoryId,
    this.active,
  });

  @override
  List<Object?> get props =>
      [id, employeeIdTemp, employeeId, department, assetInventoryId, active];

  static AssetInventoriedDepartmentRecord fromJson(Map<String, dynamic> json) {
    return AssetInventoriedDepartmentRecord(
      id: json['id'],
      employeeIdTemp:
          json['employee_id_temp'] == false ? null : json['employee_id_temp'],
      employeeId: json['employee_id'] == false ? null : json['employee_id'],
      department: json['department'] == false ? [] : json['department'],
      assetInventoryId:
          json['asset_inventory_id'] == false ? [] : json['asset_inventory_id'],
      active: json['active'] == false ? false : json['active'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_id_temp': employeeIdTemp,
      'employee_id': employeeId,
      'department': department,
      'asset_inventory_id': assetInventoryId,
      'active': active,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      'id': id,
      'employee_id_temp': employeeIdTemp,
      'employee_id': employeeId,
      'department': department,
      'asset_inventory_id': assetInventoryId,
      'active': active,
    };
  }

  static List<String> get oFields => [
        'id',
        'employee_id_temp',
        'employee_id',
        'department',
        'asset_inventory_id',
        'active',
      ];
}
