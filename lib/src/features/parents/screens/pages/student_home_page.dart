import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/features/parents/screens/pages/achievements_page.dart';
import 'package:alok_yatra_app/src/features/parents/screens/pages/activity_progress_page.dart';
import 'package:alok_yatra_app/src/features/parents/screens/pages/feedback_page.dart';
import 'package:alok_yatra_app/src/features/parents/screens/pages/parental_control_page.dart';
import 'package:alok_yatra_app/src/features/parents/screens/pages/webinars_page.dart';
import 'package:alok_yatra_app/src/styles/textstyles.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> homeOptions = [
      {
        "title": "Activity Progress",
        "icon": Icons.timeline,
        "color": Colors.blue,
        "onTap": () => navigateTo(context, ActivityProgressPage()),
      },
      {
        "title": "Feedback",
        "icon": Icons.feedback,
        "color": Colors.green,
        "onTap": () => navigateTo(context, FeedbackPage()),
      },
      {
        "title": "Webinars & Events",
        "icon": Icons.event,
        "color": Colors.purple,
        "onTap": () => navigateTo(context, WebinarsPage()),
      },
      {
        "title": "Achievements",
        "icon": Icons.star,
        "color": Colors.orange,
        "onTap": () => navigateTo(context, AchievementsPage()),
      },
      // {
      //   "title": "Direct Messaging",
      //   "icon": Icons.message,
      //   "color": Colors.teal,
      //   "onTap": () => navigateTo(context, MessagingPage()),
      // },
      // {
      //   "title": "Appointments",
      //   "icon": Icons.schedule,
      //   "color": Colors.red,
      //   "onTap": () => navigateTo(context, AppointmentPage()),
      // },
      {
        "title": "RSVP Events",
        "icon": Icons.event_available,
        "color": Colors.pink,
        "onTap": () => navigateTo(context, RSVPPage()),
      },
      {
        "title": "Parental Controls",
        "icon": Icons.settings,
        "color": Colors.deepPurple,
        "onTap": () => navigateTo(context, ParentalControlPage()),
      }
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Student Dashboard',
          style: appbarTextStyle,
        ),
        foregroundColor: Colors.white,
        backgroundColor: lightTheme.primaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Child's Profile Overview Section
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: ListTile(
                  contentPadding: EdgeInsets.all(16),
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                        'assets/profile.jpg'), // Replace with actual profile image
                  ),
                  title: Text("John Doe", style: normalStyle),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Grade: 8 | Attendance: 95%",
                        style: smallStyle,
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Recent Activity: Completed Math Assignment",
                        style: smallStyle,
                      ),
                    ],
                  ),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: lightTheme.primaryColor),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileOverviewPage()));
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Main Dashboard Options
              Expanded(
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemCount: homeOptions.length,
                    itemBuilder: (context, index) {
                      return dashboardCard(context,
                          title: homeOptions[index]["title"],
                          icon: homeOptions[index]["icon"],
                          color: homeOptions[index]["color"],
                          onTap: homeOptions[index]["onTap"]);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dashboardCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required Function() onTap}) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width(context) * 0.2,
            padding: EdgeInsets.all(width(context) * 0.04),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: color,
            ),
            child: Icon(icon, size: 40, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          width: width(context) * 0.25,
          child: Text(
            title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.clip,
            style: smallStyle,
          ),
        ),
      ],
    );
  }

  void navigateTo(BuildContext context, Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}

// Placeholder pages for navigation
class ProfileOverviewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Profile Overview')));
}

class MessagingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Direct Messaging')));
}

class AppointmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Appointments')));
}

class RSVPPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('RSVP Events')));
}
