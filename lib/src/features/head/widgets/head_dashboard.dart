import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadDashboard extends StatelessWidget {
  const HeadDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width(context),
      padding: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.blue, Colors.blue.shade400],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(children: [
                Text("Total Classes: ",
                    style: GoogleFonts.aBeeZee(color: Colors.white)),
                Text("30",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))
              ]),
              Column(children: [
                Text("Total Students: ",
                    style: GoogleFonts.aBeeZee(color: Colors.white)),
                Text("900",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))
              ]),
              Column(children: [
                Text("Total Teachers: ",
                    style: GoogleFonts.aBeeZee(color: Colors.white)),
                Text("40",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold))
              ]),
            ],
          )
        ],
      ),
    );
  }
}
