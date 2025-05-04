import 'package:alok_yatra_app/src/constant/lottie.dart';
import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/data/task_data.dart';
import 'package:alok_yatra_app/src/features/teacher/screens/pages/add_task_page.dart';
import 'package:alok_yatra_app/src/widget/teacher_task_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class TaskManagementPage extends StatefulWidget {
  const TaskManagementPage({super.key});

  @override
  _TaskManagementPageState createState() => _TaskManagementPageState();
}

class _TaskManagementPageState extends State<TaskManagementPage> {
  void _navigateToAddTaskPage() async {
    final newTask = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddTaskPage()),
    );
    if (newTask != null) {
      setState(() {
        print(newTask);
        taskData.add(newTask);
      });
    }
  }

  _priorityWidget(Color color, String title) {
    return Container(
        margin: const EdgeInsets.only(right: 5),
        padding: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          title,
          style: GoogleFonts.aBeeZee(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightTheme.primaryColor,
          foregroundColor: Colors.white,
          title: Text(
            'Task Management',
            style: GoogleFonts.aBeeZee(),
          )),
      body: taskData.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(emptyList,
                    height: height(context) * 0.3, backgroundLoading: true),
                SizedBox(
                  height: height(context) * 0.02,
                ),
                Text(
                  "You haven't assigned any task yet.",
                  style: GoogleFonts.aBeeZee(fontSize: 18),
                )
              ],
            )
          : Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Assigned Tasks",
                          style: GoogleFonts.aBeeZee(fontSize: 18),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Priority:",
                            style: GoogleFonts.aBeeZee(),
                          ),
                          Row(
                            children: [
                              _priorityWidget(Colors.red, "High"),
                              _priorityWidget(Colors.orange, "Medium"),
                              _priorityWidget(Colors.green, "Low")
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: height(context) * 0.01,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: taskData.length,
                      itemBuilder: (context, index) {
                        final task = taskData[index];
                        return teacherTaskWidget(task: task);
                      },
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _navigateToAddTaskPage,
        elevation: 1,
        icon: const Icon(Icons.add),
        label: Text(
          'Add Task',
          style: GoogleFonts.aBeeZee(),
        ),
        foregroundColor: Colors.white,
        backgroundColor: lightTheme.primaryColor.withOpacity(0.7),
      ),
    );
  }
}
