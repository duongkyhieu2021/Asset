import 'package:equatable/equatable.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class DepartmentTemporary extends Equatable implements OdooRecord {
  @override
  final int id;
  final String? name;
  final List<dynamic>? departmentId;
  final List<dynamic>? companyId;
  final bool? active;

  const DepartmentTemporary({
    required this.id,
    this.name,
    this.departmentId,
    this.companyId,
    this.active,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        departmentId,
        companyId,
        active,
      ];

  static DepartmentTemporary fromJson(Map<String, dynamic> json) {
    return DepartmentTemporary(
      id: json['id'],
      name: json['name'],
      departmentId: json['department_id'] == false ? [] : json['department_id'],
      companyId: json['company_id'] == false ? [] : json['company_id'],
      active: json['active'] == false ? false : json['active'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'department_id': departmentId,
      'company_id': companyId,
      'active': active,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      'id': id,
      'name': name,
      'department_id': departmentId,
      'company_id': companyId,
      'active': active,
    };
  }

  static List<String> get oFields => [
        'id',
        'name',
        'department_id',
        'company_id',
        'active',
      ];
}
