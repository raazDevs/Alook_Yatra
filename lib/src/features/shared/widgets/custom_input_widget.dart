import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/providers/app_functions_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CustomInputWidget extends StatefulWidget {
  const CustomInputWidget(
      {super.key,
      required this.icon,
      required this.hintText,
      required this.controller});

  final String hintText;
  final Icon icon;
  final TextEditingController controller;

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  @override
  Widget build(BuildContext context) {
    final appFunctionProvider = Provider.of<AppFunctionsProvider>(context);
    return Container(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: widget.controller,
          style: GoogleFonts.aBeeZee(fontSize: 16),
          obscureText: widget.hintText == "Password"
              ? appFunctionProvider.isHidden
              : false,
          decoration: InputDecoration(
              prefixIcon: widget.icon,
              prefixIconColor: Colors.grey,
              suffixIcon: widget.hintText == "Password"
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () =>
                              appFunctionProvider.togglePasswordVisibility(),
                          icon: const Icon(Icons.remove_red_eye)),
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: GoogleFonts.aBeeZee(color: Colors.grey),
              helperStyle: GoogleFonts.aBeeZee(),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 2, color: Colors.grey)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: lightTheme.primaryColor)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(width: 2, color: lightTheme.primaryColor))),
        ));
  }
}
