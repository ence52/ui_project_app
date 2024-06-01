import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TextInput extends StatelessWidget {
  const TextInput({super.key, required this.title, required this.hide});
  final String title;
  final bool hide;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 1.h,
      children: [
        Text(
          title,
          style: GoogleFonts.lato(
              fontSize: 9.sp, color: Colors.white, fontWeight: FontWeight.w800),
        ),
        TextField(
          decoration: InputDecoration(
              hintText: title,
              suffixIcon: hide
                  ? IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.hide_image,
                        color: Color.fromARGB(255, 121, 121, 121),
                      ))
                  : null),
        ),
      ],
    );
  }
}

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
    required this.title,
    required this.function,
  });
  final String title;
  final Function() function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 6.h,
      child: ElevatedButton(onPressed: function, child: Text(title)),
    );
  }
}
