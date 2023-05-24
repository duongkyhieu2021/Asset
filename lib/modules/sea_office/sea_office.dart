import 'package:equatable/equatable.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class SeaOffice extends Equatable implements OdooRecord {
  @override
  final int id;
  final String? officeCode;
  final String? name;
  final String? address;
  final bool? active;
  const SeaOffice({
    required this.id,
    this.officeCode,
    this.name,
    this.address,
    this.active,
  });

  @override
  List<Object?> get props => [id, officeCode, name, address, active];

  static SeaOffice fromJson(Map<String, dynamic> json) {
    return SeaOffice(
      id: json['id'],
      officeCode: json['officeCode'] == false ? '' : json['officeCode'],
      name: json['name'] == false ? '' : json['name'],
      address: json['address'] == false ? '' : json['address'],
      active: json['active'] == false ? false : json['active'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'officeCode': officeCode,
      'name': name,
      'address': address,
      'active': active,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      'id': id,
      'officeCode': officeCode,
      'name': name,
      'address': address,
      'active': active,
    };
  }

  static List<String> get oFields => [
        'id',
        'officeCode',
        'name',
        'address',
        'active',
      ];
}
