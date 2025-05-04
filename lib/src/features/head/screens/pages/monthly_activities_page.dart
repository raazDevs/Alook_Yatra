import 'package:flutter/material.dart';

class MonthlyActivitiesPage extends StatelessWidget {
  const MonthlyActivitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Activities'),
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Monthly Activities Content',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
