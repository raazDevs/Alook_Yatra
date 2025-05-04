import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthButton extends StatefulWidget {
  AuthButton(
      {super.key,
      required this.title,
      required this.onPress,
      required this.isLoading});
  String title;
  final VoidCallback? onPress;
  bool isLoading;

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: widget.onPress,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: lightTheme.primaryColor,
            foregroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            fixedSize: Size(MediaQuery.of(context).size.width * 0.8, 50)),
        child: widget.isLoading == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                widget.title,
                style: GoogleFonts.aBeeZee(),
              ));
  }
}
