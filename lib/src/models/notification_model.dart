class NotificationModel {
  int? id;
  int? userId;
  String? title;
  String? message;
  String? type;
  String? priority;
  int? referenceId;
  bool? isRead;
  String? readAt;
  String? createdAt;

  NotificationModel(
      {this.id,
      this.title,
      this.message,
      this.type,
      this.priority,
      this.readAt,
      this.createdAt,
      this.isRead,
      this.referenceId,
      this.userId});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    message = json['message'];
    type = json['type'];
    priority = json['priority'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
    isRead = json['is_read'];
    referenceId = json['reference_id'];
    userId = json['user_id'];
  }
}
