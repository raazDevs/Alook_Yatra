import 'package:alok_yatra_app/src/data/activities_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WeeklyActivitiesPage extends StatefulWidget {
  const WeeklyActivitiesPage({super.key});

  @override
  State<WeeklyActivitiesPage> createState() => _WeeklyActivitiesPageState();
}

class _WeeklyActivitiesPageState extends State<WeeklyActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Weekly Activities',
          style: GoogleFonts.aBeeZee(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
          minimum: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: dailyActivities.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom:
                            BorderSide(width: 1, color: Colors.grey.shade300))),
                child: ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  leading: const Icon(
                    Icons.check_circle,
                    color: Colors.deepPurple,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  title: Text(
                    weeklyActivities[index]["task"],
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
