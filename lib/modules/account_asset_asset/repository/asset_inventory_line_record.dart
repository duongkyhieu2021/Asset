import 'package:equatable/equatable.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class AssetInventoryLineRecord extends Equatable implements OdooRecord {
  @override
  final int id;

  final List<dynamic>? assetId;
  final List<dynamic>? assetUom;
  final List<dynamic>? assetUser;
  final List<dynamic>? assetInventoryId;
  final double? quantityThucTe;
  final double? valueResidual;
  final double? valueResidualInventory;
  final double? valueResidualDifference;
  final double? quantitySoSach;
  final double? quantityChenhLech;
  final double? valueGross;
  final double? valueGrossInventory;
  final String? status;
  final String? deXuatXuLy;
  final String? giaiTrinh;
  final String? assetCode;
  final String? note;
  final String? state;
  final bool? active;
  final bool? daDanTem;

  const AssetInventoryLineRecord(
      {required this.id,
      this.assetId,
      this.assetUom,
      this.assetUser,
      this.assetInventoryId,
      this.quantityThucTe,
      this.valueResidual,
      this.valueResidualInventory,
      this.valueResidualDifference,
      this.quantitySoSach,
      this.quantityChenhLech,
      this.valueGross,
      this.valueGrossInventory,
      this.status,
      this.deXuatXuLy,
      this.giaiTrinh,
      this.assetCode,
      this.note,
      this.state,
      this.active,
      this.daDanTem});

  @override
  List<Object?> get props => [
        id,
        assetId,
        assetUom,
        assetUser,
        assetInventoryId,
        quantityThucTe,
        valueResidual,
        valueResidualInventory,
        valueResidualDifference,
        quantitySoSach,
        quantityChenhLech,
        valueGross,
        valueGrossInventory,
        status,
        deXuatXuLy,
        giaiTrinh,
        assetCode,
        note,
        state,
        active,
        daDanTem,
      ];

  static AssetInventoryLineRecord fromJson(Map<String, dynamic> json) {
    return AssetInventoryLineRecord(
      id: json['id'],
      assetId: json['asset_id'] == false ? [] : json['asset_id'],
      assetUom: json['asset_uom'] == false ? [] : json['asset_uom'],
      assetUser: json['asset_user'] == false ? [] : json['asset_user'],
      assetInventoryId:
          json['asset_inventory_id'] == false ? [] : json['asset_inventory_id'],
      quantityThucTe:
          json['quantity_thuc_te'] == false ? 0.0 : json['quantity_thuc_te'],
      valueResidual:
          json['value_residual'] == false ? 0.0 : json['value_residual'],
      valueResidualInventory: json['value_residual_inventory'] == false
          ? 0.0
          : json['value_residual_inventory'],
      valueResidualDifference: json['value_residual_difference'] == false
          ? 0.0
          : json['value_residual_difference'],
      quantitySoSach:
          json['quantity_so_sach'] == false ? 0.0 : json['quantity_so_sach'],
      quantityChenhLech: json['quantity_chenh_lech'] == false
          ? 0.0
          : json['quantity_chenh_lech'],
      valueGross: json['value_gross'] == false ? 0.0 : json['value_gross'],
      valueGrossInventory: json['value_gross_inventory'] == false
          ? 0.0
          : json['value_gross_inventory'],
      status: json['status'] == false ? '' : json['status'],
      deXuatXuLy: json['de_xuat_xu_ly'] == false ? '' : json['de_xuat_xu_ly'],
      giaiTrinh: json['giai_trinh'] == false ? '' : json['giai_trinh'],
      assetCode: json['asset_code'] == false ? '' : json['asset_code'],
      note: json['note'] == false ? '' : json['note'],
      state: json['state'] == false ? '' : json['state'],
      active: json['active'] == false ? false : json['active'],
      daDanTem: json['da_dan_tem'] == false ? false : json['da_dan_tem'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'asset_id': assetId,
      'asset_uom': assetUom,
      'asset_user': assetUser,
      'asset_inventory_id': assetInventoryId,
      'quantity_thuc_te': quantityThucTe,
      'value_residual': valueResidual,
      'value_residual_inventory': valueResidualInventory,
      'value_residual_difference': valueResidualDifference,
      'quantity_so_sach': quantitySoSach,
      'quantity_chenh_lech': quantityChenhLech,
      'value_gross': valueGross,
      'value_gross_inventory': valueGrossInventory,
      'status': status,
      'de_xuat_xu_ly': deXuatXuLy,
      'giai_trinh': giaiTrinh,
      'asset_code': assetCode,
      'note': note,
      'state': state,
      'active': active,
      'da_dan_tem': daDanTem,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      'id': id,
      'asset_id': assetId,
      'asset_uom': assetUom,
      'asset_user': assetUser,
      'asset_inventory_id': assetInventoryId,
      'quantity_thuc_te': quantityThucTe,
      'value_residual': valueResidual,
      'value_residual_inventory': valueResidualInventory,
      'value_residual_difference': valueResidualDifference,
      'quantity_so_sach': quantitySoSach,
      'quantity_chenh_lech': quantityChenhLech,
      'value_gross': valueGross,
      'value_gross_inventory': valueGrossInventory,
      'status': status,
      'de_xuat_xu_ly': deXuatXuLy,
      'giai_trinh': giaiTrinh,
      'asset_code': assetCode,
      'note': note,
      'state': state,
      'active': active,
      'da_dan_tem': daDanTem,
    };
  }

  static List<String> get oFields => [
        'id',
        'asset_id',
        'asset_uom',
        'asset_user',
        'asset_inventory_id',
        'quantity_thuc_te',
        'value_residual',
        'value_residual_inventory',
        'value_residual_difference',
        'quantity_so_sach',
        'quantity_chenh_lech',
        'value_gross',
        'value_gross_inventory',
        'status',
        'de_xuat_xu_ly',
        'giai_trinh',
        'asset_code',
        'note',
        'state',
        'active',
        'da_dan_tem',
      ];
}
