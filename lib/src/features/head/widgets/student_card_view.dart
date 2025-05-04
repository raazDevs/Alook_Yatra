import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

studentCardView(BuildContext context) {
  return AlertDialog(
    shape: Border.all(width: 0),
    contentPadding: const EdgeInsets.symmetric(vertical: 5),
    content: Container(
      width: width(context) * 0.8,
      height: height(context) * 0.6,
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
                onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            // trailing: IconButton(
            //     onPressed: () {},
            //     icon: const Icon(Icons.sign)),
          ),
          Container(
            height: 150,
            width: 150,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue.shade100,
              border: Border.all(width: 1, color: Colors.grey.shade500),
            ),
            child: const Icon(
              Icons.person,
              size: 50,
              color: Colors.grey,
            ),
          ),
          Text(
            "Student Name",
            style:
                GoogleFonts.aBeeZee(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "lorem sfksdj fsdjfkl jsdkl fklsd jfkl sdjlfkjsdlk fklsdjfkl sdjklfsd jklfjskl ",
            textAlign: TextAlign.center,
            style: GoogleFonts.aBeeZee(),
          ),
          const SizedBox(
            height: 20,
          ),
          // ElevatedButton(
          //   onPressed: () {},
          //   style: ElevatedButton.styleFrom(
          //     fixedSize: Size(width(context) * 0.5, 50),
          //     elevation: 0,
          //     padding: const EdgeInsets.all(15),
          //     backgroundColor: Colors.blueAccent,
          //     foregroundColor: Colors.white,
          //     shape: RoundedRectangleBorder(
          //       borderRadius: BorderRadius.circular(2),
          //     ),
          //   ),
          //   child: Text(
          //     "View Details",
          //     style: GoogleFonts.aBeeZee(),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(15.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //           child: Container(
          //         height: 2,
          //         color: Colors.grey.shade300,
          //       )),
          //       Container(
          //         margin: const EdgeInsets.symmetric(horizontal: 10),
          //         child: Text(
          //           "More",
          //           style: GoogleFonts.aBeeZee(),
          //         ),
          //       ),
          //       Expanded(
          //           child: Container(
          //         height: 2,
          //         color: Colors.grey.shade300,
          //       ))
          //     ],
          //   ),
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     Column(
          //       children: [
          //         Container(
          //           height: 50,
          //           width: 70,
          //           padding: const EdgeInsets.all(15),
          //           decoration: BoxDecoration(color: Colors.blue.shade300),
          //           child: const Icon(Icons.message),
          //         ),
          //         const SizedBox(
          //           height: 5,
          //         ),
          //         Text(
          //           "Message",
          //           style: GoogleFonts.aBeeZee(),
          //         )
          //       ],
          //     ),
          //     Container(
          //       height: 50,
          //       width: 70,
          //       padding: const EdgeInsets.all(15),
          //       decoration: const BoxDecoration(color: Colors.blue),
          //       child: const Icon(Icons.message),
          //     ),
          //     Container(
          //       height: 50,
          //       width: 70,
          //       padding: const EdgeInsets.all(15),
          //       decoration: const BoxDecoration(color: Colors.blue),
          //       child: const Icon(Icons.message),
          //     )
          //   ],
          // )
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                ListTile(
                  shape:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  leading: Icon(Icons.person),
                  title: Text(
                    "Roll Number: 123",
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
                ListTile(
                  shape:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  leading: Icon(Icons.class_rounded),
                  title: Text(
                    "Class: 10th",
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
                // ListTile(
                //   shape:
                //       Border(bottom: BorderSide(color: Colors.grey.shade300)),
                //   leading: Icon(Icons.class_rounded),
                //   title: Text(
                //     "Section: A",
                //     style: GoogleFonts.aBeeZee(),
                //   ),
                // ),
                ListTile(
                  shape:
                      Border(bottom: BorderSide(color: Colors.grey.shade300)),
                  leading: Icon(Icons.bloodtype),
                  title: Text(
                    "Blood Group: O+",
                    style: GoogleFonts.aBeeZee(),
                  ),
                ),
                // ListTile(
                //   shape:
                //       Border(bottom: BorderSide(color: Colors.grey.shade300)),
                //   leading: Icon(Icons.bloodtype),
                //   title: Text(
                //     "Mobile: +91 98657348233",
                //     style: GoogleFonts.aBeeZee(),
                //   ),
                // )
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0)),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                  child: Text(
                    "See More",
                    style: GoogleFonts.aBeeZee(color: Colors.white),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}
