import 'package:equatable/equatable.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class HrJob extends Equatable implements OdooRecord {
  @override
  final int id;
  final String? name;
  const HrJob({
    required this.id,
    this.name,
  });

  @override
  List<Object?> get props => [id, name];

  static HrJob fromJson(Map<String, dynamic> json) {
    return HrJob(
      id: json['id'],
      name: json['name'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      "id": id,
      "name": name,
    };
  }

  static List<String> get oFields => [
        'id',
        'name',
      ];
}
