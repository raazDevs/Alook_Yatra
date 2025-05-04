import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget complainCard(
    {required Map<String, String> complaint, required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
    child: ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: Colors.grey.shade500),
      ),
      tileColor: Colors.grey.shade100,
      title: Text(complaint["title"]!, style: GoogleFonts.aBeeZee()),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(complaint["description"]!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.aBeeZee()),
          const SizedBox(height: 5),
          Text("Status: ${complaint["status"]}",
              style: GoogleFonts.aBeeZee(
                  color: _getStatusColor(complaint["status"]!))),
          Text(
            "Date: ${complaint["date"]}",
            style: GoogleFonts.aBeeZee(),
          ),
        ],
      ),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            title: Text(
              "Complaint Details",
              style: GoogleFonts.aBeeZee(),
              textAlign: TextAlign.center,
            ),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                complaint["title"] != null
                    ? Text(
                        "Title:\n${complaint["title"]!}",
                        style: GoogleFonts.aBeeZee(fontSize: 18),
                      )
                    : const Text("Complaint"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Description:\n${complaint["description"]}",
                  style: GoogleFonts.aBeeZee(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text("Change Status:", style: GoogleFonts.aBeeZee()),
                    const SizedBox(width: 15),
                    DropdownButton<String>(
                      value: complaint["status"],
                      onChanged: (String? value) {
                        // setState(() {
                        //   complaint["status"] = value!;
                        // });
                      },
                      items: <String>['Pending', 'In Progress', 'Resolved']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                              style: GoogleFonts.aBeeZee(
                                  color: _getStatusColor(value))),
                        );
                      }).toList(),
                    ),
                  ],
                )
              ],
            ),
            actions: [
              TextButton(onPressed: () {}, child: const Text("Done")),
              TextButton(onPressed: () {}, child: const Text("Close"))
            ],
          ),
        );
      },
    ),
  );
}

Color _getStatusColor(String status) {
  switch (status) {
    case "Resolved":
      return Colors.green;
    case "In Progress":
      return Colors.orange;
    case "Pending":
      return Colors.red;
    default:
      return Colors.grey;
  }
}
