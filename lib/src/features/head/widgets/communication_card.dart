import 'package:alok_yatra_app/src/features/head/widgets/dashboard_card.dart';
import 'package:alok_yatra_app/src/features/head/screens/pages/complain_box_page.dart';
import 'package:alok_yatra_app/src/features/head/screens/pages/events_page.dart';
import 'package:flutter/material.dart';

class CommunicationCards extends StatelessWidget {
  const CommunicationCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: MediaQuery.of(context).size.width > 600 ? 1.5 : 1.2,
      children: [
        DashboardCard(
          title: 'Complaint Box',
          icon: Icons.mail_outline,
          color: Colors.red,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ComplaintBoxPage()),
          ),
        ),
        DashboardCard(
          title: 'Webinars & Competitions',
          icon: Icons.event,
          color: Colors.purple,
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const EventsPage()),
          ),
        ),
      ],
    );
  }
}
