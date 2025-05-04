import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/styles/textstyles.dart';
import 'package:flutter/material.dart';

Widget customTextField({
  required TextEditingController controller,
  required String label,
  bool isDescription = false,
  required TextInputType type,
  required String validator,
  required String hintText,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label + " :",
          style: normalStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          style: normalStyle,
          controller: controller,
          maxLines: isDescription ? 3 : 1,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: smallStyle,
              filled: true,
              fillColor: Colors.grey.shade200,
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 2, color: lightTheme.primaryColor)),
              border: const OutlineInputBorder()),
          keyboardType: type,
          validator: (value) => value!.isEmpty ? validator : null,
        ),
      ],
    ),
  );
}
