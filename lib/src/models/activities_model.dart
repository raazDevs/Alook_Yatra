class ActivitiesModel {
  int? id;
  int? typeId;
  int? schoolId;
  String? district;
  String? subDistrict;
  String? name;
  String? description;
  int? points;
  String? status;
  String? createdAt;

  ActivitiesModel(
      {this.id,
      this.typeId,
      this.schoolId,
      this.district,
      this.subDistrict,
      this.name,
      this.description,
      this.points,
      this.status,
      this.createdAt});

  ActivitiesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeId = json['type_id'];
    schoolId = json['school_id'];
    district = json['district'];
    subDistrict = json['sub_district'];
    name = json['name'];
    description = json['description'];
    points = json['points'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type_id'] = this.typeId;
    data['school_id'] = this.schoolId;
    data['district'] = this.district;
    data['sub_district'] = this.subDistrict;
    data['name'] = this.name;
    data['description'] = this.description;
    data['points'] = this.points;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
