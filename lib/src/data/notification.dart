import 'package:alok_yatra_app/src/models/notification_model.dart';

final List<NotificationModel> notifications = [
  NotificationModel(
    id: 1,
    title: "New Assignment Posted",
    message: "A new assignment has been added to your course.",
    type: "assignment",
    priority: "high",
    createdAt: "2025-03-04 10:00 AM",
    isRead: false,
  ),
  NotificationModel(
    id: 2,
    title: "Meeting Reminder",
    message: "Your meeting with the principal is scheduled for tomorrow.",
    type: "meeting",
    priority: "medium",
    createdAt: "2025-03-03 05:00 PM",
    isRead: true,
  ),
];
