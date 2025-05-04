import 'package:flutter/material.dart';

class ParentalControlPage extends StatefulWidget {
  @override
  _ParentalControlPageState createState() => _ParentalControlPageState();
}

class _ParentalControlPageState extends State<ParentalControlPage> {
  bool notificationsEnabled = true;
  bool restrictMessaging = false;
  TimeOfDay? selectedReminderTime;

  void _pickTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedReminderTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Parental Controls')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Notifications Toggle
            SwitchListTile(
              title: Text('Enable Notifications'),
              subtitle: Text('Receive alerts for assignments & events'),
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),

            Divider(),

            // Restrict Messaging
            SwitchListTile(
              title: Text('Restrict Messaging'),
              subtitle:
                  Text('Prevent child from messaging outside study hours'),
              value: restrictMessaging,
              onChanged: (value) {
                setState(() {
                  restrictMessaging = value;
                });
              },
            ),

            Divider(),

            // Set Task Reminder
            ListTile(
              title: Text('Set Task Reminder'),
              subtitle: Text(selectedReminderTime == null
                  ? 'No reminder set'
                  : 'Reminder at ${selectedReminderTime!.format(context)}'),
              trailing: Icon(Icons.timer),
              onTap: () => _pickTime(context),
            ),

            Divider(),

            // Attendance Overview
            ListTile(
              title: Text('View Attendance'),
              subtitle: Text('Check attendance records'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AttendancePage()));
              },
            ),

            Divider(),

            // Performance Monitoring
            ListTile(
              title: Text('View Performance'),
              subtitle: Text('See grades & progress'),
              trailing: Icon(Icons.bar_chart),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PerformancePage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Placeholder Pages
class AttendancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Attendance')));
}

class PerformancePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      Scaffold(appBar: AppBar(title: Text('Performance')));
}
