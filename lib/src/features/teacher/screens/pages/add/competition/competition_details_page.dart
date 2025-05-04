import 'package:alok_yatra_app/src/widget/textfield/customTextField.dart';
import 'package:flutter/material.dart';

Widget competitionDetailsPage(
    {required Key? formkey,
    required TextEditingController nameController,
    required TextEditingController descriptionController}) {
  return Form(
    key: formkey,
    child: ListView(
      children: [
        customTextField(
          controller: nameController,
          label: "Competition Name",
          type: TextInputType.text,
          hintText: "Enter Competition Name",
          validator: "Enter Competition Name",
        ),
        customTextField(
          controller: descriptionController,
          label: "Description",
          isDescription: true,
          hintText: "Enter the Description for the competition here",
          type: TextInputType.text,
          validator: "Enter description",
        ),
      ],
    ),
  );
}
