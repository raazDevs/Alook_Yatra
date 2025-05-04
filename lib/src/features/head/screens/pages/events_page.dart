import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Webinars & Competitions',
            style: GoogleFonts.aBeeZee(),
          ),
          elevation: 0,
        ),
        body: SafeArea(
            minimum: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height: height(context) * 0.2,
                        width: width(context) * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.deepPurple.shade400,
                                  Colors.deepPurple.shade300,
                                ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add,
                                color: Colors.white, size: 40),
                            Text("Create a new event",
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        )),
                    Container(
                        height: height(context) * 0.2,
                        width: width(context) * 0.45,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Colors.deepPurple.shade400,
                                  Colors.deepPurple.shade300,
                                ])),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.add,
                                color: Colors.white, size: 40),
                            Text("Create a Zoom Meet",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white, fontSize: 18)),
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upcoming Events",
                          style: GoogleFonts.aBeeZee(fontSize: 18),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text("See All",
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 15, color: Colors.grey.shade700)))
                      ]),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: ScrollController(keepScrollOffset: false),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        height: height(context) * 0.1,
                        width: width(context),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.grey.shade400),
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: ListTile(
                            leading: const Icon(Icons.gamepad),
                            title: Text(
                              "Event Title",
                              style: GoogleFonts.aBeeZee(),
                            ),
                            subtitle: Text(
                              "Description",
                              style: GoogleFonts.aBeeZee(),
                            ),
                            trailing: Text(
                              "Date",
                              style: GoogleFonts.aBeeZee(),
                            ),
                          ),
                        )),
                  ),
                ),
                // Container(
                //   height: height(context) * 0.5,
                //   width: width(context),
                //   color: Colors.black,
                // )
              ],
            )));
  }
}
