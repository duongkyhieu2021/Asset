import 'package:equatable/equatable.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class Company extends Equatable implements OdooRecord {
  @override
  final int id;
  final String name;
  final String shortName;
  const Company({
    required this.id,
    required this.name,
    required this.shortName,
  });

  factory Company.initCompany() {
    return const Company(id: 0, name: "", shortName: "");
  }

  static Company fromJson(Map<String, dynamic> json) {
    var userId = json['id'] as int? ?? 0;
    if (userId == 0) {
      return Company.initCompany();
    }
    return Company(
      id: json["id"],
      name: json["name"],
      shortName: json["short_name"],
    );
  }

  @override
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "short_name": shortName,
      };

  @override
  List<Object?> get props => [id, name, shortName];

  static List<String> get oFields => [
        'id',
        'name',
        'short_name',
      ];

  @override
  Map<String, dynamic> toVals() {
    return {
      "id": id,
      "name": name,
      "short_name": shortName,
    };
  }
}
