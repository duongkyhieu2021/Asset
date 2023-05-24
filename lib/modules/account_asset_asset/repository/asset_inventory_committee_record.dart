import 'package:equatable/equatable.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class AssetInventoryCommitteeRecord extends Equatable implements OdooRecord {
  @override
  final int id;
  List<dynamic>? employeeIdTemp;
  List<dynamic>? employeeId;
  List<dynamic>? position;
  List<dynamic>? assetInventoryId;
  bool? active;

  AssetInventoryCommitteeRecord(
      {required this.id,
      this.employeeIdTemp,
      this.employeeId,
      this.position,
      this.assetInventoryId,
      this.active});

  @override
  List<Object?> get props =>
      [id, employeeIdTemp, employeeId, position, assetInventoryId, active];

  static AssetInventoryCommitteeRecord fromJson(Map<String, dynamic> json) {
    return AssetInventoryCommitteeRecord(
      id: json['id'],
      employeeIdTemp:
          json['employee_id_temp'] == false ? [] : json['employee_id_temp'],
      employeeId: json['employee_id'] == false ? [] : json['employee_id'],
      position: json['position'] == false ? [] : json['position'],
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
      'position': position,
      'asset_inventory_id': assetInventoryId,
      'active': active,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      'id': id,
      'employee_id_temp': employeeIdTemp!.isEmpty ? false : employeeIdTemp?[0],
      'employee_id': employeeId!.isEmpty ? false : employeeId?[0],
      'position': position!.isEmpty ? false : position?[0],
      'asset_inventory_id':
          assetInventoryId!.isEmpty ? false : assetInventoryId?[0],
      'active': active,
    };
  }

  static List<String> get oFields => [
        'id',
        'employee_id_temp',
        'employee_id',
        'position',
        'asset_inventory_id',
        'active',
      ];
}
