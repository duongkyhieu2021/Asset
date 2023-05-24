import 'package:equatable/equatable.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class AccountAssetAssetRecord extends Equatable implements OdooRecord {
  @override
  final int id;

  final String? code;
  final String? name;
  final List<dynamic>? categoryId;
  final List<dynamic>? assetType;
  final double? quantity;
  final List<dynamic>? assetUom;
  final List<dynamic>? companyId;
  final String? state;
  final String? barcode;
  final List<dynamic>? managementDept;
  final List<dynamic>? seaOfficeId;
  final List<dynamic>? assetUser;
  final String? dateFirstDepreciation;
  final String? firstDepreciationManualDate;
  // final String? assetStatusStart;
  // final String? latestInventoryStatus;
  // final String? date;
  // final List<dynamic>? accountAnalyticId;
  // final List<dynamic>? currencyId;
  // final double? value;
  // final double? salvageValue;
  // final double? valueResidual;
  // final String? vendorName;
  // final List<dynamic>? invoiceId;
  // final String? documentRef;
  // final List<dynamic>? analyticTagIds;
  // final String? note;
  // final String? acceptanceDate;
  // final String? acceptanceNumber;
  // final String? description;
  // final String? altUnit;
  // final List<dynamic>? deptOwner;
  // final String? handoverParty;
  // final String? receiverHandoverParty;
  // final List<dynamic>? procurementStaff;
  // final String? latestAssetTransferDate;
  // final String? assetReceiveDate;
  // final String? liquidationDate;
  // final String? repairDate;
  // final List<dynamic>? assetManagementDeptStaff;

  const AccountAssetAssetRecord({
    required this.id,
    required this.code,
    required this.name,
    required this.categoryId,
    required this.assetType,
    required this.quantity,
    required this.assetUom,
    required this.companyId,
    required this.state,
    required this.barcode,
    required this.managementDept,
    required this.seaOfficeId,
    required this.assetUser,
    required this.dateFirstDepreciation,
    required this.firstDepreciationManualDate,
    // required this.assetStatusStart,
    // required this.latestInventoryStatus,
    // required this.date,
    // required this.assetManagementDeptStaff,
    // required this.accountAnalyticId,
    // required this.currencyId,
    // required this.value,
    // required this.salvageValue,
    // required this.valueResidual,
    // required this.vendorName,
    // required this.invoiceId,
    // required this.documentRef,
    // required this.analyticTagIds,
    // required this.note,
    // required this.acceptanceDate,
    // required this.acceptanceNumber,
    // required this.description,
    // required this.altUnit,
    // required this.deptOwner,
    // required this.handoverParty,
    // required this.receiverHandoverParty,
    // required this.procurementStaff,
    // required this.latestAssetTransferDate,
    // required this.assetReceiveDate,
    // required this.liquidationDate,
    // required this.repairDate,
  });

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        quantity,
        categoryId,
        assetType,
        assetUom,
        companyId,
        state,
        barcode,
        managementDept,
        seaOfficeId,
        assetUser,
        dateFirstDepreciation,
        firstDepreciationManualDate,
        // assetStatusStart,
        // latestInventoryStatus,
        // date,
        // assetManagementDeptStaff,
        // acceptanceDate,
        // acceptanceNumber,
        // accountAnalyticId,
        // altUnit,
        // analyticTagIds,
        // assetReceiveDate,
        // currencyId,
        // deptOwner,
        // description,
        // documentRef,
        // handoverParty,
        // invoiceId,
        // latestAssetTransferDate,
        // liquidationDate,
        // note,
        // procurementStaff,
        // receiverHandoverParty,
        // repairDate,
        // salvageValue,
        // value,
        // valueResidual,
        // vendorName,
      ];

  static AccountAssetAssetRecord fromJson(Map<String, dynamic> json) {
    return AccountAssetAssetRecord(
      id: json['id'],
      code: json['code'] == false ? '' : json['code'],
      name: json['name'] == false ? '' : json['name'],
      categoryId: json['category_id'] == false ? [] : json['category_id'],
      assetType: json['asset_type'] == false ? [] : json['asset_type'],
      assetUom: json['asset_uom'] == false ? [] : json['asset_uom'],
      quantity: json['quantity'] == false ? 0.0 : json['quantity'],
      companyId: json['company_id'] == false ? [] : json['company_id'],
      state: json['state'] == false ? '' : json['state'],
      barcode: json['barcode'] == false ? "" : json['barcode'],
      managementDept:
          json['management_dept'] == false ? [] : json['management_dept'],
      seaOfficeId: json['sea_office_id'] == false ? [] : json['sea_office_id'],
      assetUser: json['asset_user'] == false ? [] : json['asset_user'],
      dateFirstDepreciation: json['date_first_depreciation'] == false
          ? ''
          : json['date_first_depreciation'],
      firstDepreciationManualDate:
          json['first_depreciation_manual_date'] == false
              ? ''
              : json['first_depreciation_manual_date'],
      // assetStatusStart:
      //     json['asset_status_start'] == false ? '' : json['asset_status_start'],
      // latestInventoryStatus: json['latest_inventory_status'] == false
      //     ? ''
      //     : json['latest_inventory_status'],
      // date: json['date'] == false ? "" : json['date'],
      // assetManagementDeptStaff: json['asset_management_dept_staff'] == false
      //     ? []
      //     : json['asset_management_dept_staff'],
      // acceptanceDate:
      //     json['acceptance_date'] == false ? '' : json['acceptance_date'],
      // acceptanceNumber:
      //     json['acceptance_number'] == false ? '' : json['acceptance_number'],
      // accountAnalyticId: json['account_analytic_id'] == false
      //     ? []
      //     : json['account_analytic_id'],
      // altUnit: json['alt_unit'] == false ? '' : json['alt_unit'],
      // analyticTagIds:
      //     json['analytic_tag_ids'] == false ? [] : json['analytic_tag_ids'],
      // assetReceiveDate:
      //     json['asset_receive_date'] == false ? '' : json['asset_receive_date'],
      // currencyId: json['currency_id'] == false ? [] : json['currency_id'],
      // deptOwner: json['dept_owner'] == false ? [] : json['dept_owner'],
      // description: json['description'] == false ? '' : json['description'],
      // documentRef: json['document_ref'] == false ? '' : json['document_ref'],
      // handoverParty:
      //     json['handover_party'] == false ? '' : json['handover_party'],
      // invoiceId: json['invoice_id'] == false ? [] : json['invoice_id'],
      // latestAssetTransferDate: json['latest_asset_transfer_date'] == false
      //     ? ''
      //     : json['latest_asset_transfer_date'],
      // liquidationDate:
      //     json['liquidation_date'] == false ? '' : json['liquidation_date'],
      // note: json['note'] == false ? '' : json['note'],
      // // partnerId: json['partner_id'] == false ? "" : json['partner_id'],
      // procurementStaff:
      //     json['procurement_staff'] == false ? [] : json['procurement_staff'],
      // receiverHandoverParty: json['receiver_handover_party'] == false
      //     ? ''
      //     : json['receiver_handover_party'],
      // repairDate: json['repair_date'] == false ? '' : json['repair_date'],
      // salvageValue: json['salvage_value'] == false ? '' : json['salvage_value'],
      // value: json['value'] == false ? '' : json['value'],
      // valueResidual:
      //     json['value_residual'] == false ? '' : json['value_residual'],
      // vendorName: json['vendor_name'] == false ? '' : json['vendor_name'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'name': name,
      'quantity': quantity,
      'category_id': categoryId,
      'asset_type': assetType,
      'asset_uom': assetUom,
      'company_id': companyId,
      'state': state,
      'barcode': barcode,
      'management_dept': managementDept,
      'sea_office_id': seaOfficeId,
      'asset_user': assetUser,
      "date_first_depreciation": dateFirstDepreciation,
      "first_depreciation_manual_date": firstDepreciationManualDate,
      // 'asset_status_start': assetStatusStart,
      // 'latest_inventory_status': latestInventoryStatus,
      // 'date': date,
      // 'asset_management_dept_staff': assetManagementDeptStaff,
      // "acceptance_date": acceptanceDate,
      // "acceptance_number": acceptanceNumber,
      // "account_analytic_id": accountAnalyticId,
      // "alt_unit": altUnit,
      // "analytic_tag_ids": analyticTagIds,
      // "asset_receive_date": assetReceiveDate,
      // "currency_id": currencyId,
      // "dept_owner": deptOwner,
      // "description": description,
      // "document_ref": documentRef,
      // "handover_party": handoverParty,
      // "invoice_id": invoiceId,
      // "latest_asset_transfer_date": latestAssetTransferDate,
      // "liquidation_date": liquidationDate,
      // "note": note,
      // "procurement_staff": procurementStaff,
      // "receiver_handover_party": receiverHandoverParty,
      // "repair_date": repairDate,
      // "salvage_value": salvageValue,
      // "value": value,
      // "value_residual": valueResidual,
      // "vendor_name": vendorName,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      "id": id,
      "code": code,
      "name": name,
      "quantity": quantity,
      "category_id": categoryId,
      "asset_type": assetType,
      "asset_uom": assetUom,
      "company_id": companyId,
      "state": state,
      "barcode": barcode,
      "management_dept": managementDept,
      "sea_office_id": seaOfficeId,
      "asset_user": assetUser,
      "date_first_depreciation": dateFirstDepreciation,
      "first_depreciation_manual_date": firstDepreciationManualDate,
      // "asset_status_start": assetStatusStart,
      // "latest_inventory_status": latestInventoryStatus,
      // "date": date,
      // "asset_management_dept_staff": assetManagementDeptStaff,
      // "asset_receive_date": assetReceiveDate,
      // "currency_id": currencyId,
      // "dept_owner": deptOwner,
      // "description": description,
      // "document_ref": documentRef,
      // "handover_party": handoverParty,
      // "invoice_id": invoiceId,
      // "latest_asset_transfer_date": latestAssetTransferDate,
      // "liquidation_date": liquidationDate,
      // "note": note,
      // "procurement_staff": procurementStaff,
      // "receiver_handover_party": receiverHandoverParty,
      // "repair_date": repairDate,
      // "salvage_value": salvageValue,
      // "value": value,
      // "value_residual": valueResidual,
      // "vendor_name": vendorName,
    };
  }

  static List<String> get oFields => [
        "id",
        "code",
        "name",
        "quantity",
        "category_id",
        "asset_type",
        "asset_uom",
        "company_id",
        "state",
        "barcode",
        "management_dept",
        "sea_office_id",
        "asset_user",
        "date_first_depreciation",
        "first_depreciation_manual_date",

        // "asset_status_start",
        // "latest_inventory_status",
        // "date",
        // "asset_management_dept_staff",
        // "acceptance_date",
        // "acceptance_number",
        // "account_analytic_id",
        // "alt_unit",
        // "analytic_tag_ids",
        // "asset_receive_date",
        // "currency_id",
        // "dept_owner",
        // "description",
        // "document_ref",
        // "handover_party",
        // "invoice_id",
        // "latest_asset_transfer_date",
        // "liquidation_date",
        // "note",
        // "procurement_staff",
        // "receiver_handover_party",
        // "repair_date",
        // "salvage_value",
        // "value",
        // "value_residual",
        // "vendor_name",
      ];
}
