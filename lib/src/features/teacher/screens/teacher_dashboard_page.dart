import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/constant/color.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/competitions_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/life_skill_activity_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/student_feedback_page.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/task_management_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TeacherDashboard extends StatelessWidget {
  List<Map<String, dynamic>> dashboardContent = [
    {
      'icon': Icons.task,
      'title': 'Task Management',
      'subtitle': 'Manage daily, weekly, and monthly tasks',
      'onTap': TaskManagementPage(),
    },
    {
      'icon': Icons.feedback,
      'title': 'Student Feedback',
      'subtitle': 'Send feedback to parents',
      'onTap': StudentFeedbackPage()
    },
    {
      'icon': Icons.psychology,
      'title': 'Life Skills',
      'subtitle': 'Track and manage life skills',
      'onTap': LifeSkillActivitiesPage(),
    },
    {
      'icon': Icons.sports,
      'title': 'Competitions',
      'subtitle': 'Schedule and manage competitions',
      'onTap': CompetitionPage(),
    },
    {
      'icon': Icons.school,
      'title': 'Students',
      'subtitle': 'Manage students and their activities',
      'onTap': CompetitionPage(),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Good Morning, Teacher',
          style: GoogleFonts.aBeeZee(color: Colors.white),
        ),
        backgroundColor: lightTheme.primaryColor,
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                backgroundColor: Colors.grey.shade300,
                child: const Icon(Icons.person_2_rounded),
              ))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: width(context),
        height: height(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade600),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Assigned Tasks",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("5",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, color: Colors.blue)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Upcoming Events",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text("3",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 20, color: Colors.green)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height(context) * 0.02,
            ),
            // Dashboard Grid
            Expanded(
              child: GridView.builder(
                itemCount: dashboardContent.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) => _buildDashboardCard(context,
                    icon: dashboardContent[index]['icon'],
                    title: dashboardContent[index]['title'],
                    subtitle: dashboardContent[index]['subtitle'],
                    color: tileColor[index % tileColor.length],
                    goTo: dashboardContent[index]['onTap']),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required Color color,
      required Widget goTo}) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => goTo)),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(icon, size: 40, color: color),
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: GoogleFonts.aBeeZee(
                    fontSize: 12,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
