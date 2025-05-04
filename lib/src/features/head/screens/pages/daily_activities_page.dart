import 'package:alok_yatra_app/src/data/activities_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DailyActivitiesPage extends StatefulWidget {
  const DailyActivitiesPage({super.key});

  @override
  State<DailyActivitiesPage> createState() => _DailyActivitiesPageState();
}

class _DailyActivitiesPageState extends State<DailyActivitiesPage> {
  final TextEditingController _activityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Daily Activities',
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
                    dailyActivities[index],
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple.shade300,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              contentPadding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              title: Text(
                "Add New Daily Activity",
                style: GoogleFonts.aBeeZee(),
              ),
              content: TextField(
                controller: _activityController,
                style: GoogleFonts.aBeeZee(),
                decoration: InputDecoration(
                  hintStyle: GoogleFonts.aBeeZee(),
                  hintText: 'Enter Activity',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Add',
                      style: GoogleFonts.aBeeZee(),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.aBeeZee(),
                    ))
              ],
            ),
          );
        },
        icon: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        label: Text(
          'Add Activity',
          style: GoogleFonts.aBeeZee(color: Colors.white),
        ),
      ),
    );
  }
}
