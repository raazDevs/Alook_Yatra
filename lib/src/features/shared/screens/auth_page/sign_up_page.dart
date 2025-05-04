import 'package:alok_yatra_app/src/constant/size.dart';
import 'package:alok_yatra_app/src/constant/theme.dart';
import 'package:alok_yatra_app/src/features/shared/screens/auth_page/sign_in_page.dart';
import 'package:alok_yatra_app/src/features/shared/widgets/auth_button.dart';
import 'package:alok_yatra_app/src/features/shared/widgets/wave_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/custom_input_widget.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _fullName = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height * 0.45,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  color: lightTheme.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome",
                        style: GoogleFonts.aBeeZee(
                            fontSize: 35, color: Colors.white),
                      ),
                      Text(
                        "Let's get started by create your account",
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
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                child: Column(
                  children: [
                    CustomInputWidget(
                      hintText: "Full Name",
                      icon: const Icon(Icons.person),
                      controller: _fullName,
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
                    // Align(
                    //   alignment: Alignment.centerLeft,
                    //   child: TextButton(
                    //       onPressed: () {},
                    //       child: Text(
                    //         "Forgot Password?",
                    //         style: GoogleFonts.aBeeZee(
                    //             fontSize: 15,
                    //             color:
                    //                 Color(AppColor.lightColor["primaryColor"])),
                    //       )),
                    // ),
                    SizedBox(
                      height: height(context) * 0.05,
                    ),
                    AuthButton(
                      title: "REGISTER",
                      onPress: () => print("Hello"),
                      isLoading: false,
                    ),
                    // Container(
                    //   width: MediaQuery.of(context).size.width,
                    //   margin: const EdgeInsets.symmetric(vertical: 20),
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         height: 2,
                    //         width: MediaQuery.of(context).size.width * 0.4,
                    //         color: Colors.grey.shade300,
                    //       ),
                    //       Text(
                    //         "or",
                    //         style: GoogleFonts.aBeeZee(
                    //             color: Colors.grey, fontSize: 15),
                    //       ),
                    //       Container(
                    //         height: 2,
                    //         color: Colors.grey.shade300,
                    //         width: MediaQuery.of(context).size.width * 0.4,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    // Expanded(
                    //   // color: Colors.white,
                    //   // width: MediaQuery.of(context).size.width,
                    //   child: ListView.builder(
                    //     shrinkWrap: true,
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: signinOptions.length,
                    //     itemBuilder: (context, index) => Container(
                    //       width: MediaQuery.of(context).size.width * 0.2,
                    //       height: 60,
                    //       margin: const EdgeInsets.symmetric(horizontal: 10),
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         border: Border.all(width: 1, color: Colors.grey),
                    //       ),
                    //       child: Center(
                    //         child: Icon(
                    //           signinOptions[index]["icon"],
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already Have an Account?",
                          style: GoogleFonts.aBeeZee(),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: const SignInPage(),
                                      type: PageTransitionType.bottomToTop,
                                      duration: Duration(milliseconds: 500)));
                            },
                            child:
                                Text("Sign In", style: GoogleFonts.aBeeZee()))
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
