import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project_app/pages/main_page_.dart';
import 'package:ui_project_app/pages/sign_up_page.dart';
import 'package:ui_project_app/theme.dart';
import 'package:ui_project_app/widgets/sign_in_page_widgets.dart';

// ignore: must_be_immutable
class SignInPage extends StatefulWidget {
  SignInPage({super.key, required this.checkBoxBool});
  bool checkBoxBool = false;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
                  "Sign In",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const TextInput(
                hide: false,
                title: "Username",
              ),
              const TextInput(
                hide: true,
                title: "Password",
              ),
              createRememberAndForgot(),
              SignInButton(
                title: "Login",
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
              ),
              const OrWithDivider(text: "Or Sign Up With"),
              const OtherButtons(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Does not have an account?",
                    style: TextStyle(fontSize: 9.sp, color: themeTextGrey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUpPage()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 9.sp,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          fontWeight: FontWeight.bold),
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

  Container createRememberAndForgot() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        height: 4.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Switch(
                  value: widget.checkBoxBool,
                  onChanged: (bool? newValue) {
                    setState(() {
                      widget.checkBoxBool = newValue!;
                    });
                  },
                ),
                Text(
                  "Remember Me",
                  style: GoogleFonts.lato(
                    fontSize: 9.5.sp,
                    color: themeTextGrey,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Forgot Password?",
                style: GoogleFonts.lato(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white,
                    decorationThickness: BorderSide.strokeAlignOutside,
                    fontSize: 9.5.sp,
                    color: themeTextGrey,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ));
  }
}
