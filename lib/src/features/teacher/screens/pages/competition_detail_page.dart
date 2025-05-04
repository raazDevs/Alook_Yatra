import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/models/competition_model.dart';
import 'package:alok_yatra_app/src/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompetitionDetailPage extends StatelessWidget {
  final CompetitionModel competition;

  const CompetitionDetailPage({Key? key, required this.competition})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: lightTheme.primaryColor,
            foregroundColor: Colors.white,
            title: Text(
              competition.name,
              style: appbarTextStyle,
            )),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Competition Name
                  Text(
                    competition.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),

                  // Description
                  Text(
                    competition.description,
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 12),

                  // District & Sub-District
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.blue),
                      const SizedBox(width: 8),
                      Text(
                          "${competition.district}, ${competition.subDistrict}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Dates
                  _buildDetailRow("📅 Start Date:", competition.startDate),
                  _buildDetailRow("🏁 End Date:", competition.endDate),
                  _buildDetailRow("📝 Registration Deadline:",
                      competition.registrationDeadline),
                  const SizedBox(height: 12),

                  // Participants Info
                  Row(
                    children: [
                      Icon(Icons.group, color: Colors.green),
                      const SizedBox(width: 8),
                      Text(
                          "Participants: ${competition.minParticipants} - ${competition.maxParticipants}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Status
                  Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.orange),
                      const SizedBox(width: 8),
                      Text("Status: ${competition.status.toUpperCase()}",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.orange)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

Widget _buildDetailRow(String label, DateTime date) {
  return Row(
    children: [
      Icon(Icons.calendar_today, color: Colors.blue),
      const SizedBox(width: 8),
      Text("$label ${DateFormat('MMM dd, yyyy – HH:mm').format(date)}",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
    ],
  );
}
