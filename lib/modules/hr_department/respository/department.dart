import 'package:equatable/equatable.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class Department extends Equatable implements OdooRecord {
  @override
  final int id;
  final String? name;
  final List<dynamic>? companyId;
  final List<dynamic>? parentId;
  final List<dynamic>? childIds;
  final List<dynamic>? managerId;
  final List<dynamic>? memberIds;
  final List<dynamic>? jobsIds;
  final List<dynamic>? managerIds;
  const Department({
    required this.id,
    this.name,
    this.companyId,
    this.parentId,
    this.childIds,
    this.managerId,
    this.memberIds,
    this.jobsIds,
    this.managerIds,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        companyId,
        parentId,
        childIds,
        managerId,
        memberIds,
        jobsIds,
        managerIds,
      ];

  static Department fromJson(Map<String, dynamic> json) {
    return Department(
      id: json['id'],
      name: json['name'],
      companyId: json['company_id'],
      parentId: json['partner_id'],
      childIds: json['child_ids'],
      managerId: json['manager_id'],
      memberIds: json['member_ids'],
      jobsIds: json['jobs_ids'],
      managerIds: json['manager_ids'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'company_id': companyId,
      'partner_id': parentId,
      'child_ids': childIds,
      'manager_id': managerId,
      'member_ids': memberIds,
      'jobs_ids': jobsIds,
      'manager_ids': managerIds,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      'id': id,
      'name': name,
      'company_id': companyId,
      'partner_id': parentId,
      'child_ids': childIds,
      'manager_id': managerId,
      'member_ids': memberIds,
      'jobs_ids': jobsIds,
      'manager_ids': managerIds,
    };
  }

  static List<String> get oFields => [
        'id',
        'name',
        'company_id',
        'partner_id',
        'child_ids',
        'manager_id',
        'member_ids',
        'jobs_ids',
        'manager_ids',
      ];
}
