import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/data/competitions_data.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/add_competition_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/competition_detail_page.dart';
import 'package:alok_yatra_app/src/styles/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompetitionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightTheme.primaryColor,
          foregroundColor: Colors.white,
          title: Text(
            "Competition Details",
            style: appbarTextStyle,
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _customFilterButton("Publised", Colors.amber.shade300),
                  _customFilterButton("Draft", Colors.grey.shade300),
                  _customFilterButton("Completed", Colors.green.shade300),
                  _customFilterButton("Cancelled", Colors.red.shade300),
                  _customFilterButton("Ongoing", Colors.blue.shade300),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: competitions.length,
                  itemBuilder: (context, index) {
                    final competition = competitions[index];
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  width: 10,
                                  color:
                                      _taskBorderColor(competition.status)))),
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade400),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              bottomRight: Radius.circular(12)),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 16),
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue.shade100,
                            child: const Icon(
                              Icons.emoji_events,
                              color: Colors.amber,
                              size: 24,
                            ),
                          ),
                          title: Text(competition.name, style: titleStyle),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  // "Status: ${competition.status.toUpperCase()}",
                                  competition.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: descriptionStyle),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    size: 15,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    DateFormat('dd-MM-yyyy')
                                        .format(competition.createdAt),
                                    style: verySmallStyle,
                                  ),
                                ],
                              )
                            ],
                          ),
                          trailing: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.shade50,
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 16,
                              color: Colors.blue.shade800,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CompetitionDetailPage(
                                    competition: competition),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: lightTheme.primaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddCompetitionPage(),
              ));
        },
        icon: const Icon(Icons.add),
        label: Text(
          "New Competition",
          style: smallStyle,
        ),
      ),
    );
  }
}

_customFilterButton(String title, Color color) {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color,
              border: Border.all(width: 1)),
          child: Text(
            title,
            style: verySmallStyle,
          ),
        ),
      ));
}

Color _taskBorderColor(task) {
  switch (task) {
    case "completed":
      return Colors.green.shade300;
    case "ongoing":
      return Colors.blue.shade300;
    case "cancelled":
      return Colors.red.shade300;
    case "draft":
      return Colors.grey.shade300;
    default:
      return Colors.amber.shade300;
  }
}
