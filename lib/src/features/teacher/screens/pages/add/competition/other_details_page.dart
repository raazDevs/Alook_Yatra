import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/widget/textfield/customTextField.dart';
import 'package:alok_yatra_app/src/widget/textfield/custom_date_selection_tile.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../styles/textstyles.dart';

class OtherDetailsPage extends StatefulWidget {
  final Key? formKey;
  final TextEditingController minParticipantsController;
  final TextEditingController maxParticipantsController;
  final String selectedStatus;
  final List<String> statusOptions;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? registrationDeadline;
  final Function(DateTime) onStartDateSelected;
  final Function(DateTime) onEndDateSelected;
  final Function(DateTime) onRegDeadlineSelected;

  OtherDetailsPage({
    required this.formKey,
    required this.minParticipantsController,
    required this.maxParticipantsController,
    required this.selectedStatus,
    required this.statusOptions,
    required this.endDate,
    required this.registrationDeadline,
    required this.startDate,
    required this.onStartDateSelected,
    required this.onEndDateSelected,
    required this.onRegDeadlineSelected,
    super.key,
  });

  @override
  _OtherDetailsPageState createState() => _OtherDetailsPageState();
}

class _OtherDetailsPageState extends State<OtherDetailsPage> {
  Future<void> _pickDate(
      BuildContext context, Function(DateTime) onSelected) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      onSelected(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: ListView(
        children: [
          customTextField(
            controller: widget.minParticipantsController,
            label: "Minimum Participants",
            type: TextInputType.number,
            hintText: "Enter minimum participants in Numbers",
            validator: "Enter minimum participants",
          ),
          customTextField(
            controller: widget.maxParticipantsController,
            label: "Max Participants",
            hintText: "Enter maximum participants in Numbers",
            type: TextInputType.number,
            validator: "Enter maximum participants",
          ),
          // Date Seletion
          customDateSelection("End date", widget.endDate,
              () => _pickDate(context, widget.onEndDateSelected)),
          customDateSelection("Start Date", widget.startDate,
              () => _pickDate(context, widget.onStartDateSelected)),
          customDateSelection(
              "Registration Deadline",
              widget.registrationDeadline,
              () => _pickDate(context, widget.onRegDeadlineSelected)),
          DropdownButtonFormField<String>(
            focusColor: Colors.blue,
            value: widget.selectedStatus,
            items: widget.statusOptions.map((status) {
              return DropdownMenuItem(
                value: status,
                child: Text(
                  status.toUpperCase(),
                  style: normalStyle,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {});
            },
            decoration: InputDecoration(
                labelText: "Status",
                border: const OutlineInputBorder(
                    borderSide: BorderSide(
                  width: 1,
                )),
                labelStyle: smallStyle,
                floatingLabelStyle: GoogleFonts.aBeeZee(color: Colors.blue),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: lightTheme.primaryColor))),
          ),
        ],
      ),
    );
  }
}
