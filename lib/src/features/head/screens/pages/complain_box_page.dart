import 'package:alok_yatra_app/src/data/complain_data.dart';
import 'package:alok_yatra_app/src/features/head/widgets/complain_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ComplaintBoxPage extends StatelessWidget {
  ComplaintBoxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Complaints', style: GoogleFonts.aBeeZee()),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                _customFilterButton("Pending", Colors.red),
                const SizedBox(
                  width: 10,
                ),
                _customFilterButton("In Progress", Colors.orange),
                const SizedBox(
                  width: 10,
                ),
                _customFilterButton("Resolved", Colors.green),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: complaints.length,
              itemBuilder: (context, index) {
                final complaint = complaints[index];
                return complainCard(complaint: complaint, context: context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

_customFilterButton(String title, Color color) {
  return OutlinedButton(
      onPressed: () {},
      style: OutlinedButton.styleFrom(
        backgroundColor: color,
      ),
      child: Text(
        title,
        style: GoogleFonts.aBeeZee(color: Colors.white),
      ));
}
