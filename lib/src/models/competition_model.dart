class CompetitionModel {
  final int id;
  final int typeId;
  final int schoolId;
  final String district;
  final String subDistrict;
  final String name;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final DateTime registrationDeadline;
  final int minParticipants;
  final int maxParticipants;
  final String status;
  final int createdBy;
  final DateTime createdAt;

  CompetitionModel({
    required this.id,
    required this.typeId,
    required this.schoolId,
    required this.district,
    required this.subDistrict,
    required this.name,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.registrationDeadline,
    required this.minParticipants,
    required this.maxParticipants,
    required this.status,
    required this.createdBy,
    required this.createdAt,
  });

  // Factory constructor to create an instance from a JSON object
  factory CompetitionModel.fromJson(Map<String, dynamic> json) {
    return CompetitionModel(
      id: json['id'],
      typeId: json['type_id'],
      schoolId: json['school_id'],
      district: json['district'],
      subDistrict: json['sub_district'],
      name: json['name'],
      description: json['description'],
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      registrationDeadline: DateTime.parse(json['registration_deadline']),
      minParticipants: json['min_participants'],
      maxParticipants: json['max_participants'],
      status: json['status'],
      createdBy: json['created_by'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  // Method to convert the instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type_id': typeId,
      'school_id': schoolId,
      'district': district,
      'sub_district': subDistrict,
      'name': name,
      'description': description,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'registration_deadline': registrationDeadline.toIso8601String(),
      'min_participants': minParticipants,
      'max_participants': maxParticipants,
      'status': status,
      'created_by': createdBy,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
