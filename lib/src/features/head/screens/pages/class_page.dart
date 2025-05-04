import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:alok_yatra_app/src/data/classroom_data.dart';
import 'package:alok_yatra_app/src/features/head/screens/pages/class_details_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class ClassPage extends StatelessWidget {
  ClassPage({super.key});

  final List<Color> lightColors = [
    Colors.pink[100]!,
    Colors.blue[100]!,
    Colors.green[100]!,
    Colors.yellow[200]!,
    Colors.red[100]!,
    Colors.orange[100]!,
    Colors.purple[100]!,
    Colors.teal[100]!,
  ];

  List sortOptions = [
    "Sort by class (↓)",
    "Sort by class (↑)",
    "Sort by total students (↑)",
    "Sort by total students(↓)"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Classes",
          style: GoogleFonts.aBeeZee(),
        ),
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
              onPressed: () {
                showMenu(
                    context: context,
                    position: RelativeRect.fromLTRB(
                        width(context) - 50, 0, 0, height(context)),
                    items: sortOptions
                        .map((e) => PopupMenuItem(child: Text(e)))
                        .toList());
              },
              icon: const Icon(Icons.sort))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GridView.builder(
            itemCount: classDetails.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 3 / 2),
            itemBuilder: (context, index) {
              final classData = classDetails[index];
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              child: ClassDetailsPage(
                                classId: classData["class"],
                              ),
                              type: PageTransitionType.rightToLeft));
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Ink(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: lightColors[index % lightColors.length],
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: ListTile(
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Class ${classData["class"]}",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Total: ${classData["totalStudents"]}",
                                style: GoogleFonts.aBeeZee(),
                              ),
                              Text(
                                "Section : ${classData["section"]}",
                                style: GoogleFonts.aBeeZee(),
                              ),
                              Text(
                                "Room No. : ${classData["roomNo"]}",
                                style: GoogleFonts.aBeeZee(),
                              )
                            ],
                          ),
                          trailing: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[200]),
                              child: classData["teacherPhoto"]),
                        ),
                      ),
                    ),
                  ));
            }),
      ),
    );
  }
}
