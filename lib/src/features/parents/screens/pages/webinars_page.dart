import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class WebinarsPage extends StatefulWidget {
  @override
  _WebinarsPageState createState() => _WebinarsPageState();
}

class _WebinarsPageState extends State<WebinarsPage> {
  List<Map<String, dynamic>> upcomingWebinars = [
    {
      'title': 'AI in Education',
      'dateTime': DateTime(2025, 3, 10, 15, 30),
      'speaker': 'Dr. John Doe',
      'registered': false
    },
    {
      'title': 'Cybersecurity Awareness',
      'dateTime': DateTime(2025, 3, 15, 18, 00),
      'speaker': 'Jane Smith',
      'registered': true
    },
  ];

  List<Map<String, dynamic>> pastWebinars = [
    {
      'title': 'Blockchain in EdTech',
      'dateTime': DateTime(2025, 2, 20, 14, 00),
      'speaker': 'Alice Brown',
      'recording': 'https://example.com/recording1'
    },
  ];

  // Helper function to format countdown timer
  String getCountdown(DateTime eventTime) {
    Duration difference = eventTime.difference(DateTime.now());
    if (difference.isNegative) return 'Event Ended';
    return '${difference.inDays}d ${difference.inHours % 24}h ${difference.inMinutes % 60}m';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Webinars & Events')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Upcoming Webinars
            Text(
              'Upcoming Webinars',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...upcomingWebinars.map((webinar) => Card(
                  child: ListTile(
                    title: Text(webinar['title']),
                    subtitle: Text(
                      'Speaker: ${webinar['speaker']}\n'
                      'Date: ${DateFormat('MMM dd, yyyy – hh:mm a').format(webinar['dateTime'])}\n'
                      'Countdown: ${getCountdown(webinar['dateTime'])}',
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          webinar['registered'] = !webinar['registered'];
                        });
                      },
                      child: Text(
                          webinar['registered'] ? 'Registered' : 'Register'),
                    ),
                  ),
                )),

            SizedBox(height: 20),

            // Past Webinars
            Text(
              'Past Webinars',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ...pastWebinars.map((webinar) => Card(
                  child: ListTile(
                    title: Text(webinar['title']),
                    subtitle: Text(
                      'Speaker: ${webinar['speaker']}\n'
                      'Date: ${DateFormat('MMM dd, yyyy – hh:mm a').format(webinar['dateTime'])}',
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.video_library, color: Colors.blue),
                      onPressed: () {
                        // Open webinar recording (dummy action)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Opening: ${webinar['recording']}')),
                        );
                      },
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
