import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Container teacherTaskWidget({required task}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10.0),
    decoration: BoxDecoration(
        border: Border(
      left: BorderSide(
          width: 5,
          color: task.priority == 'High'
              ? Colors.red
              : task.priority == 'Medium'
                  ? Colors.orange
                  : Colors.green,
          style: BorderStyle.solid),
    )),
    child: ListTile(
      tileColor: Colors.grey.shade200,
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(10)),
      leading: const Icon(Icons.task_alt),
      title: Text(
        task.title.toString().toUpperCase(),
        style: GoogleFonts.aBeeZee(),
      ),
      subtitle: Text(
        '${task.description}',
        style: GoogleFonts.aBeeZee(),
      ),
      trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {}),
    ),
  );
}
