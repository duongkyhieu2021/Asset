import 'package:equatable/equatable.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class User extends Equatable implements OdooRecord {
  @override
  final int id;
  final List<dynamic>? partnerId;
  final List<dynamic>? companyIds;
  final List<dynamic>? companyId;
  final String? login;
  final String? name;
  final String? image;
  // final String sign;

  const User({
    required this.id,
    required this.partnerId,
    required this.companyIds,
    required this.companyId,
    required this.login,
    required this.name,
    required this.image,
    // required this.sign,
  });

  factory User.publicUser() {
    return const User(
      id: 0,
      partnerId: [],
      companyIds: [],
      companyId: [],
      login: '',
      name: '',
      image: '',
    );
  }

  bool get isPublic => id == 0 ? true : false;

  User copyWith({
    int? id,
    List<dynamic>? partnerId,
    List<dynamic>? companyIds,
    List<dynamic>? companyId,
    String? login,
    String? name,
    String? image,
    // String? sign,
  }) {
    return User(
      id: id ?? this.id,
      partnerId: partnerId ?? this.partnerId,
      companyIds: companyIds ?? this.companyIds,
      companyId: companyId ?? this.companyId,
      login: login ?? this.login,
      name: name ?? this.name,
      image: image ?? this.image,
      // sign: sign ?? this.sign,
    );
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      'partner_id': partnerId,
      'login': login,
      'name': name,
      // 'sign_signature': sign,
    };
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'partner_id': partnerId,
      'login': login,
      'name': name,
      'image': image,
      // 'sign_signature': sign,
    };
  }

  /// Creates [User] from JSON
  static User fromJson(Map<String, dynamic> json) {
    var userId = json['id'] as int? ?? 0;
    if (userId == 0) {
      return User.publicUser();
    }

    return User(
      id: userId,
      partnerId: json['partner_id'] as List<dynamic>? ?? [],
      companyIds: json['company_ids'] as List<dynamic>? ?? [],
      companyId: json['company_id'] as List<dynamic>? ?? [],
      login: json['login'] as String? ?? '',
      name: json['name'] as String? ?? '',
      image: json['image'] == false ? null : json['image'],
      // sign: json['sign_signature'] as String? ?? '',
    );
  }

  // Equatable stuff to compare records
  @override
  List<Object?> get props => [id, partnerId, login, name, image];

  // List of fields we need to fetch
  static List<String> get oFields => [
        'id',
        'partner_id',
        'company_ids',
        'company_id',
        'image',
        'login',
        'name',
        // 'sign_signature',
      ];
}
