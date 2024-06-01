import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project_app/pages/sign_up_page.dart';
import 'package:ui_project_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Workout App',
          theme: initializeTheme(),
          home: const SignUpPage(),
        );
      },
    );
  }
}
