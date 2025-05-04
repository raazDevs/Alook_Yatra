class StudentAwards {
  int? id;
  int? studentId;
  int? awardId;
  String? awardedDate;
  String? academicYear;
  int? month;
  int? pointsEarned;
  String? certificateUrl;
  String? createdAt;

  StudentAwards(
      {this.id,
      this.studentId,
      this.awardId,
      this.awardedDate,
      this.academicYear,
      this.month,
      this.pointsEarned,
      this.certificateUrl,
      this.createdAt});

  StudentAwards.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentId = json['student_id'];
    awardId = json['award_id'];
    awardedDate = json['awarded_date'];
    academicYear = json['academic_year'];
    month = json['month'];
    pointsEarned = json['points_earned'];
    certificateUrl = json['certificate_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['student_id'] = studentId;
    data['award_id'] = awardId;
    data['awarded_date'] = awardedDate;
    data['academic_year'] = academicYear;
    data['month'] = month;
    data['points_earned'] = pointsEarned;
    data['certificate_url'] = certificateUrl;
    data['created_at'] = createdAt;
    return data;
  }
}
