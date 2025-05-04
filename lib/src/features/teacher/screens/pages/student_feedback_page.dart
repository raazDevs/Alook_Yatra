import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/data/student_feedback.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentFeedbackPage extends StatelessWidget {
  bool isTeacherFeedback = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          'Student Feedback',
          style: GoogleFonts.aBeeZee(),
        ),
        backgroundColor: lightTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: studentFeedback.length,
          itemBuilder: (context, index) {
            final feedback = studentFeedback[index];
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "From : ${feedback["studentName"]} → ${feedback["teacherName"]}",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      feedback["feedback"],
                      style: GoogleFonts.aBeeZee(
                          fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "⭐ ${feedback["rating"]}",
                          style: GoogleFonts.aBeeZee(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange),
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.thumb_up_alt_outlined,
                                  color: Colors.blueAccent),
                            ),
                            Text(
                              "Give a like",
                              style: GoogleFonts.aBeeZee(
                                  color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
