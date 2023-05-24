import 'package:equatable/equatable.dart';
//import 'package:odoo_repository/odoo_repository.dart';
import 'package:sea_hr/OdooRepository/odoo_repository.dart';

class EmployeeMulti extends Equatable implements OdooRecord {
  const EmployeeMulti({
    required this.id,
    this.name,
    this.userId,
    this.scId,
    this.departmentId,
    this.jobId,
  });

  @override
  final int id;
  final List<dynamic>? name;
  final List<dynamic>? userId;
  final String? scId;
  final List<dynamic>? departmentId;
  final List<dynamic>? jobId;

  @override
  List<Object?> get props => [id, name, scId, departmentId, jobId];

  static EmployeeMulti fromJson(Map<String, dynamic> json) {
    return EmployeeMulti(
      id: json['id'],
      name: json['name'],
      userId: json['user_id'] == false ? null : json['user_id'],
      scId: json['s_identification_id'],
      departmentId:
          json['department_id'] == false ? null : json['department_id'],
      jobId: json['job_id'] == false ? null : json['job_id'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "user_id": userId,
      "s_identification_id": scId,
      "department_id": departmentId,
      "job_id": jobId,
    };
  }

  @override
  Map<String, dynamic> toVals() {
    return {
      "id": id,
      "name": name,
      "user_id": userId,
      "s_identification_id": scId,
      "department_id": departmentId,
      "job_id": jobId,
    };
  }

  static List<String> get oFields => [
        'id',
        'name',
        'user_id',
        's_identification_id',
        'department_id',
        'job_id',
      ];
}

// class Employee {
//   Employee({
//     this.id,
//     this.name,
//     this.spouseBirthdate,
//     this.sIdentificationId,
//     this.countryId,
//     this.ethnicity,
//     this.religion,
//     this.bankId,
//     this.accNumber,
//     this.accHolderName,
//     this.seaPersonalEmail,
//     this.mainPhoneNumber,
//     this.secondPhoneNumber,
//     this.seaPermanentAddr,
//     this.permanentCountryId,
//     this.permanentCityId,
//     this.permanentDistrictId,
//     this.seaTempAddr,
//     this.temporaryCountryId,
//     this.temporaryCityId,
//     this.temporaryDistrictId,
//     this.identificationId,
//     this.seaIdIssueDate,
//     this.idIssuePlace,
//     this.idExpiryDate,
//     this.idAttachmentId,
//     this.passportId,
//     this.seaPassportIssueDate,
//     this.seaPassportIssuePlace,
//     this.passportExpiryDate,
//     this.addressHomeId,
//     this.emergencyContact,
//     this.emergencyPhone,
//     this.kmHomeWork,
//     this.gender,
//     this.marital,
//     this.spouseCompleteName,
//     this.birthday,
//     this.children,
//     this.placeOfBirth,
//     this.countryOfBirth,
//     this.visaNo,
//     this.permitNo,
//     this.visaExpire,
//     this.certificate,
//     this.studyField,
//     this.studySchool,
//     this.additionalNote,
//     this.famIds,
//     this.extraNote,
//     this.image,
//   });

//   int? id;
//   String? name;
//   String? spouseBirthdate;
//   String? sIdentificationId;
//   List<dynamic>? countryId;
//   String? ethnicity;
//   String? religion;
//   List<dynamic>? bankId;
//   String? accNumber;
//   String? accHolderName;
//   String? seaPersonalEmail;
//   String? mainPhoneNumber;
//   String? secondPhoneNumber;
//   String? seaPermanentAddr;
//   List<dynamic>? permanentCountryId;
//   List<dynamic>? permanentCityId;
//   List<dynamic>? permanentDistrictId;
//   String? seaTempAddr;
//   List<dynamic>? temporaryCountryId;
//   List<dynamic>? temporaryCityId;
//   List<dynamic>? temporaryDistrictId;
//   String? identificationId;
//   DateTime? seaIdIssueDate;
//   List<dynamic>? idIssuePlace;
//   DateTime? idExpiryDate;
//   List<dynamic>? idAttachmentId;
//   String? passportId;
//   DateTime? seaPassportIssueDate;
//   List<dynamic>? seaPassportIssuePlace;
//   DateTime? passportExpiryDate;
//   List<dynamic>? addressHomeId;
//   String? emergencyContact;
//   String? emergencyPhone;
//   int? kmHomeWork;
//   String? gender;
//   String? marital;
//   String? spouseCompleteName;
//   DateTime? birthday;
//   int? children;
//   String? placeOfBirth;
//   List<dynamic>? countryOfBirth;
//   String? visaNo;
//   String? permitNo;
  
//   DateTime? visaExpire;
//   String? certificate;
//   String? studyField;
//   String? studySchool;
//   String? additionalNote;
//   List<int?>? famIds;
//   String? extraNote;
//   String? image;

//   factory Employee.fromJson(Map<String, dynamic> json) => Employee(
//         id: json["id"],
//         name: json["name"],
//         spouseBirthdate:
//             json["spouse_birthdate"] == false ? "" : json["spouse_birthdate"],
//         sIdentificationId: json["s_identification_id"] == false
//             ? ""
//             : json["s_identification_id"],
//         countryId: json["country_id"] == false
//             ? []
//             : List<dynamic>.from(json["country_id"]!.map((x) => x)),
//         ethnicity: json["ethnicity"] == false ? "" : json["ethnicity"],
//         religion: json["religion"] == false ? "" : json["religion"],
//         bankId: json["bank_id"] == false
//             ? []
//             : List<dynamic>.from(json["bank_id"]!.map((x) => x)),
//         accNumber: json["acc_number"] == false ? "" : json["acc_number"],
//         accHolderName:
//             json["acc_holder_name"] == false ? "" : json["acc_holder_name"],
//         seaPersonalEmail: json["sea_personal_email"] == false
//             ? ""
//             : json["sea_personal_email"],
//         mainPhoneNumber: json["main_phone_number"] == false
//             ? ""
//             : json["main_phone_number"],
//         secondPhoneNumber: json["second_phone_number"] == false
//             ? ""
//             : json["second_phone_number"],
//         seaPermanentAddr: json["sea_permanent_addr"],
//         permanentCountryId: json["permanent_country_id"] == false
//             ? []
//             : List<dynamic>.from(json["permanent_country_id"]!.map((x) => x)),
//         permanentCityId: json["permanent_city_id"] == false
//             ? []
//             : List<dynamic>.from(json["permanent_city_id"]!.map((x) => x)),
//         permanentDistrictId: json["permanent_district_id"] == false
//             ? []
//             : List<dynamic>.from(json["permanent_district_id"]!.map((x) => x)),
//         seaTempAddr:
//             json["sea_temp_addr"] == false ? "" : json["sea_temp_addr"],
//         temporaryCountryId: json["temporary_country_id"] == false
//             ? []
//             : List<dynamic>.from(json["temporary_country_id"]!.map((x) => x)),
//         temporaryCityId: json["temporary_city_id"] == false
//             ? []
//             : List<dynamic>.from(json["temporary_city_id"]!.map((x) => x)),
//         temporaryDistrictId: json["temporary_district_id"] == false
//             ? []
//             : List<dynamic>.from(json["temporary_district_id"]!.map((x) => x)),
//         identificationId: json["identification_id"] == false
//             ? ""
//             : json["identification_id"],
//         seaIdIssueDate: DateTime.parse(json["sea_id_issue_date"]),
//         idIssuePlace: json["id_issue_place"] == false
//             ? []
//             : List<dynamic>.from(json["id_issue_place"]!.map((x) => x)),
//         idExpiryDate: json["id_expiry_date"] == false
//             ? DateTime.now()
//             : DateTime.parse(json["id_expiry_date"]),
//         idAttachmentId: json["id_attachment_id"] == false
//             ? []
//             : List<dynamic>.from(json["id_attachment_id"]!.map((x) => x)),
//         passportId: json["passport_id"] == false ? "" : json["passport_id"],
//         seaPassportIssueDate: json["sea_passport_issue_date"] == false
//             ? DateTime.now()
//             : DateTime.parse(json["sea_passport_issue_date"]),
//         seaPassportIssuePlace: json["sea_passport_issue_place"] == false
//             ? []
//             : List<dynamic>.from(
//                 json["sea_passport_issue_place"]!.map((x) => x)),
//         passportExpiryDate: json["passport_expiry_date"] == false
//             ? DateTime.now()
//             : DateTime.parse(json["passport_expiry_date"]),
//         addressHomeId:
//             json["address_home_id"] == false ? "" : json["address_home_id"],
//         emergencyContact: json["emergency_contact"] == false
//             ? ""
//             : json["emergency_contact"],
//         emergencyPhone:
//             json["emergency_phone"] == false ? "" : json["emergency_phone"],
//         kmHomeWork: json["km_home_work"] == false ? "" : json["km_home_work"],
//         gender: json["gender"] == false ? "" : json["gender"],
//         marital: json["marital"] == false ? "" : json["marital"],
//         spouseCompleteName: json["spouse_complete_name"] == false
//             ? ""
//             : json["spouse_complete_name"],
//         birthday: json["birthday"] == false
//             ? DateTime.now()
//             : DateTime.parse(json["birthday"]),
//         children: json["children"] == false ? "" : json["children"],
//         placeOfBirth:
//             json["place_of_birth"] == false ? "" : json["place_of_birth"],
//         countryOfBirth: json["country_of_birth"] == false
//             ? []
//             : List<dynamic>.from(json["country_of_birth"]!.map((x) => x)),
//         visaNo: json["visa_no"] == false ? "" : json["visa_no"],
//         permitNo: json["permit_no"] == false ? "" : json["permit_no"],
//         visaExpire: json["visa_expire"] == false ? DateTime.now()
//             : DateTime.parse(json["visa_expire"]),
//         certificate: json["certificate"] == false ? "" : json["certificate"],
//         studyField: json["study_field"] == false ? "" : json["study_field"],
//         studySchool:
//             json["study_school"] == false ? "" : json["study_school"],
//         additionalNote:
//             json["additional_note"] == "flase" ? "" : json["additional_note"],
//         famIds: json["fam_ids"] == false
//             ? []
//             : List<int?>.from(json["fam_ids"]!.map((x) => x)),
//         extraNote: json["extra_note"] == false ? "" : json["extra_note"],
//         image: json["image"] == false ? "" : json["image"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "spouse_birthdate": spouseBirthdate,
//         "s_identification_id": sIdentificationId,
//         "country_id": countryId == null
//             ? []
//             : List<dynamic>.from(countryId!.map((x) => x)),
//         "ethnicity": ethnicity,
//         "religion": religion,
//         "bank_id":
//             bankId == null ? [] : List<dynamic>.from(bankId!.map((x) => x)),
//         "acc_number": accNumber,
//         "acc_holder_name": accHolderName,
//         "sea_personal_email": seaPersonalEmail,
//         "main_phone_number": mainPhoneNumber,
//         "second_phone_number": secondPhoneNumber,
//         "sea_permanent_addr": seaPermanentAddr,
//         "permanent_country_id": permanentCountryId == null
//             ? []
//             : List<dynamic>.from(permanentCountryId!.map((x) => x)),
//         "permanent_city_id": permanentCityId == null
//             ? []
//             : List<dynamic>.from(permanentCityId!.map((x) => x)),
//         "permanent_district_id": permanentDistrictId == null
//             ? []
//             : List<dynamic>.from(permanentDistrictId!.map((x) => x)),
//         "sea_temp_addr": seaTempAddr,
//         "temporary_country_id": temporaryCountryId == null
//             ? []
//             : List<dynamic>.from(temporaryCountryId!.map((x) => x)),
//         "temporary_city_id": temporaryCityId == null
//             ? []
//             : List<dynamic>.from(temporaryCityId!.map((x) => x)),
//         "temporary_district_id": temporaryDistrictId == null
//             ? []
//             : List<dynamic>.from(temporaryDistrictId!.map((x) => x)),
//         "identification_id": identificationId,
//         "sea_id_issue_date":
//             "${seaIdIssueDate!.year.toString().padLeft(4, '0')}-${seaIdIssueDate!.month.toString().padLeft(2, '0')}-${seaIdIssueDate!.day.toString().padLeft(2, '0')}",
//         "id_issue_place": idIssuePlace == null
//             ? []
//             : List<dynamic>.from(idIssuePlace!.map((x) => x)),
//         "id_expiry_date": idExpiryDate,
//         "id_attachment_id": idAttachmentId == null
//             ? []
//             : List<dynamic>.from(idAttachmentId!.map((x) => x)),
//         "passport_id": passportId,
//         "sea_passport_issue_date": seaPassportIssueDate,
//         "sea_passport_issue_place": seaPassportIssuePlace,
//         "passport_expiry_date": passportExpiryDate,
//         "address_home_id": addressHomeId,
//         "emergency_contact": emergencyContact,
//         "emergency_phone": emergencyPhone,
//         "km_home_work": kmHomeWork,
//         "gender": gender,
//         "marital": marital,
//         "spouse_complete_name": spouseCompleteName,
//         "birthday":
//             "${birthday!.year.toString().padLeft(4, '0')}-${birthday!.month.toString().padLeft(2, '0')}-${birthday!.day.toString().padLeft(2, '0')}",
//         "children": children,
//         "place_of_birth": placeOfBirth,
//         "country_of_birth": countryOfBirth == null
//             ? []
//             : List<dynamic>.from(countryOfBirth!.map((x) => x)),
//         "visa_no": visaNo,
//         "permit_no": permitNo,
//         "visa_expire": visaExpire,
//         "certificate": certificate,
//         "study_field": studyField,
//         "study_school": studySchool,
//         "additional_note": additionalNote,
//         "fam_ids":
//             famIds == null ? [] : List<dynamic>.from(famIds!.map((x) => x)),
//         "extra_note": extraNote,
//         "image": image,
//       };
// }
