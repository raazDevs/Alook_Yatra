import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationCard extends StatelessWidget {
  final dynamic notification;
  final VoidCallback? onTap;

  // ignore: use_super_parameters
  const NotificationCard({
    Key? key,
    required this.notification,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.grey.shade200,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildStatusIndicator(),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notification.title ?? "No Title",
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: notification.isRead
                              ? Colors.grey.shade700
                              : Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        notification.message ?? "No Message",
                        style: GoogleFonts.aBeeZee(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      _buildNotificationFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusIndicator() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color:
            notification.isRead ? Colors.grey.shade200 : Colors.blue.shade100,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          notification.isRead ? Icons.check : Icons.notifications_active,
          color: notification.isRead ? Colors.grey : Colors.blue,
          size: 24,
        ),
      ),
    );
  }

  Widget _buildNotificationFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Timestamp
        Text(
          notification.createdAt ?? "",
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade500,
          ),
        ),

        // Read/Unread Status
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color:
                notification.isRead ? Colors.green.shade50 : Colors.red.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            notification.isRead ? "Read" : "Unread",
            style: TextStyle(
              color: notification.isRead ? Colors.green : Colors.red,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
