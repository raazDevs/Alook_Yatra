import 'package:flutter/material.dart';

class AchievementsPage extends StatelessWidget {
  final int totalTasksCompleted = 120; // Example data
  final int currentStreak = 5; // Days of consecutive task completion
  final int highestStreak = 10; // Record highest streak

  final List<Map<String, dynamic>> badges = [
    {
      'title': 'Beginner',
      'description': 'Completed 10 tasks',
      'achieved': true
    },
    {
      'title': 'Task Master',
      'description': 'Completed 50 tasks',
      'achieved': true
    },
    {
      'title': 'Streak Hero',
      'description': '5-day streak achieved!',
      'achieved': true
    },
    {
      'title': 'Legend',
      'description': '10-day streak achieved!',
      'achieved': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Achievements')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Total Tasks Completed
            Card(
              elevation: 3,
              child: ListTile(
                title: Text("Total Tasks Completed",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text("$totalTasksCompleted",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 10),

            // Current Streak
            Card(
              elevation: 3,
              child: ListTile(
                title: Text("Current Streak",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.local_fire_department, color: Colors.orange),
                    SizedBox(width: 5),
                    Text("$currentStreak days",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),

            // Highest Streak
            Card(
              elevation: 3,
              child: ListTile(
                title: Text("Highest Streak",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                trailing: Text("$highestStreak days",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 20),

            // Achievements Section
            Text("Badges Earned",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: badges.length,
                itemBuilder: (context, index) {
                  final badge = badges[index];
                  return Card(
                    elevation: 2,
                    child: ListTile(
                      leading: Icon(
                        badge['achieved'] ? Icons.emoji_events : Icons.lock,
                        color: badge['achieved'] ? Colors.amber : Colors.grey,
                      ),
                      title: Text(badge['title']),
                      subtitle: Text(badge['description']),
                      trailing: badge['achieved']
                          ? Icon(Icons.check_circle, color: Colors.green)
                          : Icon(Icons.lock_outline, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
