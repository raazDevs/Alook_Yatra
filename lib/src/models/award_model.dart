class AwardModel {
  int? id;
  String? name;
  String? description;
  int? pointsThreshold;
  String? badgeUrl;
  String? createdAt;

  AwardModel(
      {this.id,
      this.name,
      this.description,
      this.pointsThreshold,
      this.badgeUrl,
      this.createdAt});

  AwardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    pointsThreshold = json['points_threshold'];
    badgeUrl = json['badge_url'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['points_threshold'] = this.pointsThreshold;
    data['badge_url'] = this.badgeUrl;
    data['created_at'] = this.createdAt;
    return data;
  }
}
