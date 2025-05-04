import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AddTaskPage extends StatefulWidget {
  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final _formKey = GlobalKey<FormState>();
  String? _title, _description, _priority;
  DateTime? _deadline;
  final _priorityColors = {
    'High': Colors.red[400],
    'Medium': Colors.orange[400],
    'Low': Colors.green[400],
  };

  Color _iconColor = lightTheme.primaryColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Create New Task',
          style: GoogleFonts.aBeeZee(
            color: Colors.black87,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Task Title
                  _buildSectionTitle('Task Title'),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    decoration: InputDecoration(
                      hintText: 'Enter task title',
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.task_alt, color: _iconColor),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? 'Please enter a task title' : null,
                    onSaved: (value) => _title = value,
                  ),
                  SizedBox(height: 24),
                  // Task Description
                  _buildSectionTitle('Description'),
                  TextFormField(
                    style: GoogleFonts.aBeeZee(),
                    decoration: InputDecoration(
                      hintText: 'Enter task description',
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.description, color: _iconColor),
                    ),
                    maxLines: 3,
                    onSaved: (value) => _description = value,
                  ),
                  SizedBox(height: 24),

                  // Task Deadline
                  _buildSectionTitle('Deadline'),
                  InkWell(
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary: _iconColor,
                                onPrimary: Colors.white,
                                surface: Colors.white,
                                onSurface: Colors.black,
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      if (pickedDate != null) {
                        setState(() => _deadline = pickedDate);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today, color: _iconColor),
                          const SizedBox(width: 12),
                          Text(
                            _deadline == null
                                ? 'Select Deadline'
                                : DateFormat('MMM dd, yyyy').format(_deadline!),
                            style: GoogleFonts.aBeeZee(
                              color: _deadline == null
                                  ? Colors.grey[600]
                                  : Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Priority
                  _buildSectionTitle('Priority'),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.flag, color: _iconColor),
                    ),
                    style: GoogleFonts.aBeeZee(),
                    value: _priority,
                    items: ['High', 'Medium', 'Low'].map((priority) {
                      return DropdownMenuItem(
                        value: priority,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 12),
                          decoration: BoxDecoration(
                            color: _priorityColors[priority],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(priority),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) => setState(() => _priority = value),
                    validator: (value) =>
                        value == null ? 'Please select a priority' : null,
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _iconColor,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        'Create Task',
                        style: GoogleFonts.aBeeZee(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: GoogleFonts.aBeeZee(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.pop(
          context,
          TaskModel(
            title: _title,
            description: _description,
            priority: _priority,
            deadline: _deadline != null
                ? DateFormat('yyyy-MM-dd').format(_deadline!)
                : null,
          ));
    }
  }
}
