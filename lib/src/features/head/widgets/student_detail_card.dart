import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:alok_yatra_app/src/features/head/widgets/student_card_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentDetailCard extends StatelessWidget {
  final String rollno;

  const StudentDetailCard({Key? key, required this.rollno}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
          context: context, builder: (context) => studentCardView(context)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border.all(width: 1, color: Colors.grey.shade500),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height(context) * 0.1,
              width: height(context) * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(width: 1, color: Colors.grey.shade500),
              ),
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "Student Name",
              style: GoogleFonts.aBeeZee(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              "Roll No. ${rollno}",
              style: GoogleFonts.aBeeZee(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
