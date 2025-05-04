import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:alok_yatra_app/src/features/head/widgets/search_bar.dart';
import 'package:alok_yatra_app/src/features/head/widgets/student_detail_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassDetailsPage extends StatelessWidget {
  const ClassDetailsPage({super.key, required this.classId});
  final String classId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Class $classId",
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            height: height(context) * 0.2,
            width: width(context),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.blue, Colors.blueAccent],
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: height(context) * 0.15,
                  width: height(context) * 0.15,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade800, width: 1),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Class Teacher Name:\nSurendra Kumar",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Total Students in class:\n40",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.aBeeZee(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          const SizedBox(height: 20),
          // Search Bar Section
          searchBar(),
          const SizedBox(height: 15),
          // Students Grid Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Students of Class $classId",
                    style: GoogleFonts.aBeeZee(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return StudentDetailCard(
                            rollno: (index + 1).toString());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
