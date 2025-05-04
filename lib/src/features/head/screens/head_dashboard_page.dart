import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/features/head/widgets/communication_card.dart';
import 'package:alok_yatra_app/src/features/head/widgets/dashboard_card.dart';
import 'package:alok_yatra_app/src/features/head/screens/pages/class_details_page.dart';
import 'package:alok_yatra_app/src/features/head/screens/pages/class_page.dart';
import 'package:alok_yatra_app/src/features/head/screens/pages/daily_activities_page.dart';
import 'package:alok_yatra_app/src/features/head/screens/pages/monthly_activities_page.dart';
import 'package:alok_yatra_app/src/features/head/screens/pages/weekly_activities_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadDashboardPage extends StatelessWidget {
  const HeadDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightTheme.scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Principal Dashboard',
          style: GoogleFonts.aBeeZee(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: lightTheme.primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor.withOpacity(0.1),
              Colors.white,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WelcomeHeader(),
              SizedBox(height: 24),
              Text(
                'Activity Management',
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const ActivityCards(),
              const SizedBox(height: 24),
              Text(
                'Communication & Events',
                style: GoogleFonts.aBeeZee(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              const CommunicationCards(),
            ],
          ),
        ),
      ),
    );
  }
}

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.1),
            child: Icon(
              Icons.person,
              size: 35,
              color: Theme.of(context).primaryColor,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome, Principal',
                style: GoogleFonts.aBeeZee(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Manage your school activities',
                style: GoogleFonts.aBeeZee(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ActivityCards extends StatelessWidget {
  const ActivityCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 3 : 2,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.2,
      children: [
        DashboardCard(
          title: 'Daily Activities',
          icon: Icons.check_circle,
          color: Colors.green,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DailyActivitiesPage()),
          ),
        ),
        DashboardCard(
          title: 'Weekly Activities',
          icon: Icons.calendar_today,
          color: Colors.blue,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WeeklyActivitiesPage()),
          ),
        ),
        DashboardCard(
          title: 'Class Details',
          icon: Icons.class_,
          color: Colors.red,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClassPage()),
          ),
        ),
        DashboardCard(
          title: 'Monthly Activities',
          icon: Icons.timeline,
          color: Colors.orange,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const MonthlyActivitiesPage()),
          ),
        ),
      ],
    );
  }
}
