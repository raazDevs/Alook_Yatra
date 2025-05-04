import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/providers/auth_provider.dart';
import 'package:alok_yatra_app/src/features/shared/screens/auth_page/forgot_password_page.dart';
import 'package:alok_yatra_app/src/features/shared/screens/auth_page/sign_up_page.dart';
import 'package:alok_yatra_app/src/features/shared/widgets/auth_button.dart';
import 'package:alok_yatra_app/src/features/shared/widgets/custom_input_widget.dart';
import 'package:alok_yatra_app/src/features/shared/widgets/wave_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  List<Map<String, dynamic>> signinOptions = [
    {"icon": Bootstrap.google},
    {"icon": Bootstrap.twitter},
    {"icon": Bootstrap.facebook}
  ];
  final List<String> roles = ['Headmaster', 'Teacher', 'Student'];
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ClipPath(
                clipper: WaveWidget(),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  color: lightTheme.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome Back",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 35, color: Colors.white),
                      ),
                      Text(
                        "Let's get back to your account now.",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 18, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: DropdownButtonFormField<String>(
                        style: GoogleFonts.aBeeZee(color: Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person_pin_sharp,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  width: 2, color: Colors.grey)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 2, color: lightTheme.primaryColor)),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  width: 2, color: lightTheme.primaryColor)),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                        ),
                        hint: Text(
                          'You are a ',
                          style: GoogleFonts.aBeeZee(
                              color: Colors.grey, fontSize: 16),
                        ),
                        value: selectedRole,
                        borderRadius: BorderRadius.circular(10),
                        items: roles.map((role) {
                          return DropdownMenuItem<String>(
                            value: role,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                role,
                                style: GoogleFonts.aBeeZee(fontSize: 16),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value;
                          });
                        },
                      ),
                    ),
                    CustomInputWidget(
                      hintText: "Email",
                      icon: const Icon(Icons.email),
                      controller: _email,
                    ),
                    CustomInputWidget(
                      hintText: "Password",
                      icon: const Icon(Icons.lock),
                      controller: _password,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: ForgotPasswordPage(),
                                    type: PageTransitionType.leftToRight));
                          },
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.aBeeZee(
                                fontSize: 15, color: lightTheme.primaryColor),
                          )),
                    ),
                    Expanded(child: Container()),
                    AuthButton(
                      title: "SIGN IN",
                      isLoading: authProvider.isLoading,
                      onPress: () => authProvider.signIn(
                          context, _email.text, _password.text, selectedRole!),
                    ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Doesn't Have an Account?",
                          style: GoogleFonts.aBeeZee(),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: SignUpPage(),
                                      type: PageTransitionType.topToBottom,
                                      duration:
                                          const Duration(milliseconds: 500)));
                            },
                            child: Text("Register Now",
                                style: GoogleFonts.aBeeZee(color: Colors.red)))
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
