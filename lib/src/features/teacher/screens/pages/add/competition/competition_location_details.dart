import 'package:alok_yatra_app/src/widget/textfield/customTextField.dart';
import 'package:flutter/material.dart';

Widget locationDetailsPage(
    {required Key? formkey,
    required TextEditingController districtController,
    required TextEditingController subDistrictController}) {
  return Form(
    key: formkey,
    child: ListView(
      children: [
        customTextField(
          controller: districtController,
          label: "District",
          type: TextInputType.text,
          hintText: "Enter School's District",
          validator: "Enter district",
        ),
        customTextField(
          controller: subDistrictController,
          label: "Sub-District",
          hintText: "Enter School's Sub-District",
          type: TextInputType.text,
          validator: "Enter sub-district",
        ),
      ],
    ),
  );
}
