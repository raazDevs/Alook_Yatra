import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/features/shared/widgets/auth_button.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Forgot Password",
          style: GoogleFonts.aBeeZee(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: TextField(
              cursorColor: lightTheme.primaryColor,
              decoration: InputDecoration(
                hintText: "Enter your email or phone number",
                hintStyle: GoogleFonts.aBeeZee(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(width: 2, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      BorderSide(width: 2, color: lightTheme.primaryColor),
                ),
              ),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Back To Signin",
                style: GoogleFonts.aBeeZee(color: Colors.white),
              )),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: _isVisible,
            child: DelayedDisplay(
              delay: const Duration(microseconds: 400),
              fadeIn: true,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Text(
                      "Filled The Code Here",
                      style: GoogleFonts.aBeeZee(fontSize: 18),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    OtpTextField(
                      numberOfFields: 5,
                      cursorColor: lightTheme.primaryColor,

                      focusedBorderColor: lightTheme.primaryColor,
                      borderColor: Colors.grey,
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        //handle validation or checks here
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Verification Code"),
                                content:
                                    Text('Code entered is $verificationCode'),
                              );
                            });
                      }, // end onSubmit
                    ),
                  ],
                ),
              ),
            ),
          ),
          AuthButton(
              title: "Get Code",
              onPress: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              isLoading: false),
        ]),
      ),
    );
  }
}
