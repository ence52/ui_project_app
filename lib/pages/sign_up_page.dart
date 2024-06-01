import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project_app/pages/sign_in_page.dart';
import 'package:ui_project_app/theme.dart';
import 'package:ui_project_app/widgets/sign_in_page_widgets.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(8.w),
          child: Wrap(
            runSpacing: 2.h,
            children: [
              Center(
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              const TextInput(
                hide: false,
                title: "Username",
              ),
              const TextInput(
                hide: false,
                title: "E-mail",
              ),
              const TextInput(
                hide: true,
                title: "Password",
              ),
              const TextInput(
                hide: true,
                title: "Confirm Password",
              ),
              SignInButton(
                title: "Sign Up",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignInPage(
                              checkBoxBool: false,
                            )),
                  );
                },
              ),
              const OrWithDivider(
                text: "Or Login With",
              ),
              const OtherButtons(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account!",
                    style: TextStyle(fontSize: 9.sp, color: themeTextGrey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignInPage(
                                  checkBoxBool: false,
                                )),
                      );
                    },
                    child: Text(
                      "Login ",
                      style: TextStyle(
                        fontSize: 9.sp,
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OrWithDivider extends StatelessWidget {
  const OrWithDivider({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 3.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 2.w, right: 4.w),
                  child: const Divider(
                    thickness: 1.5,
                    color: Color.fromARGB(120, 192, 192, 192),
                  ))),
          Text(
            text,
            style: TextStyle(fontSize: 9.sp, color: themeTextGrey),
          ),
          Expanded(
              child: Container(
                  margin: EdgeInsets.only(left: 4.w, right: 2.w),
                  child: const Divider(
                    thickness: 1.5,
                    color: Color.fromARGB(120, 192, 192, 192),
                  ))),
        ],
      ),
    );
  }
}

class OtherButtons extends StatelessWidget {
  const OtherButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h, // Set the desired height
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset("assets/icons/google.svg"),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset("assets/icons/apple.svg"),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
            child: SizedBox(
              height: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset("assets/icons/facebook.svg"),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
