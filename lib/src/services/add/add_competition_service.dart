import 'dart:ffi';
import 'dart:math';

import 'package:alok_yatra_app/src/data/competitions_data.dart';
import 'package:alok_yatra_app/src/models/competition_model.dart';
import 'package:flutter/material.dart';

class CompetitionService {
  // Function to submit competition
  void submitCompetition({
    required BuildContext context,
    required GlobalKey<FormState> formKey1,
    required GlobalKey<FormState> formKey2,
    required GlobalKey<FormState> formKey3,
    required TextEditingController nameController,
    required TextEditingController descriptionController,
    required TextEditingController districtController,
    required TextEditingController subDistrictController,
    required TextEditingController minParticipantsController,
    required TextEditingController maxParticipantsController,
    required String status,
    required DateTime? startDate,
    required DateTime? endDate,
    required DateTime? registrationDeadline,
    required Function() resetState,
  }) {
    // Validate dates
    if (startDate == null || endDate == null || registrationDeadline == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select all dates"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (endDate.isBefore(startDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("End date must be after start date"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (registrationDeadline.isAfter(startDate)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Registration deadline must be before start date"),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    competitions.add(CompetitionModel(
        id: competitions.length + 1,
        typeId: competitions.length + 1,
        schoolId: 34,
        district: districtController.text,
        subDistrict: subDistrictController.text,
        name: nameController.text,
        description: descriptionController.text,
        startDate: startDate,
        endDate: endDate,
        registrationDeadline: registrationDeadline,
        minParticipants: int.parse(minParticipantsController.text),
        maxParticipants: int.parse(maxParticipantsController.text),
        status: status,
        createdBy: 3,
        createdAt: DateTime.now()));

    // Success message
    print("Competition Added Successfully!");
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Competition Added Successfully!"),
        duration: Duration(seconds: 2),
      ),
    );

    // Reset form and state
    formKey1.currentState?.reset();
    formKey2.currentState?.reset();
    formKey3.currentState?.reset();
    nameController.clear();
    descriptionController.clear();
    districtController.clear();
    subDistrictController.clear();
    minParticipantsController.clear();
    maxParticipantsController.clear();

    // Call the resetState function to reset the state in the UI
    resetState();

    // Navigate back
    Navigator.pop(context);
  }
}
