class SchoolModel {
  final String id;
  final String name;
  final String code;
  final String district;
  final String subDistrict;
  final String state;
  final SchoolType schoolType;
  final String address;
  final String contactEmail;
  final String contactPhone;
  final String principalId;
  final Status status;
  final DateTime createdAt;
  final DateTime updatedAt;

  SchoolModel({
    required this.id,
    required this.name,
    required this.code,
    required this.district,
    required this.subDistrict,
    required this.state,
    required this.schoolType,
    required this.address,
    required this.contactEmail,
    required this.contactPhone,
    required this.principalId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });
}

enum SchoolType { primary, secondary, higherSecondary }

enum Status { active, inactive }
