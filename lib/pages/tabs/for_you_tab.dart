import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project_app/theme.dart';

class ForYouTab extends StatelessWidget {
  const ForYouTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 2.h),
      color: themeBackground,
      child: Wrap(
        runSpacing: 4.h,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: const [
          ScrollWidget(
            title: "New Workouts",
            photo1: AssetImage("assets/images/cardio.png"),
            photo2: AssetImage("assets/images/yoga.png"),
            description: "10 Minute Cardio",
            description2: "Yoga",
          ),
          ScrollWidget(
            title: "Home Workouts",
            photo1: AssetImage("assets/images/noEquipment.png"),
            photo2: AssetImage("assets/images/withEquipment.png"),
            description: "Without Equipments",
            description2: "With Equipments",
          ),
          ScrollWidget(
            title: "Strength Workouts",
            photo1: AssetImage("assets/images/upperBody.png"),
            photo2: AssetImage("assets/images/lowerBody.png"),
            description: "Upper Body",
            description2: "Lower Body",
          ),
        ],
      ),
    );
  }
}

class ScrollWidget extends StatelessWidget {
  const ScrollWidget({
    super.key,
    required this.title,
    required this.photo1,
    required this.photo2,
    required this.description,
    required this.description2,
  });
  final String title;
  final String description;
  final String description2;
  final ImageProvider photo1;
  final ImageProvider photo2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Text(
            title,
            style: TextStyle(
                fontSize: 15.sp,
                color: tabBarSelected,
                fontWeight: FontWeight.w300),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        SizedBox(
          height: 20.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 3.w,
              ),
              ExerciseBox(
                photo: photo1,
                description: description,
              ),
              ExerciseBox(
                photo: photo2,
                description: description2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ExerciseBox extends StatelessWidget {
  const ExerciseBox(
      {super.key, required this.photo, required this.description});
  final ImageProvider photo;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.w,
        width: 50.w,
        alignment: Alignment.center,
        child: Column(
          children: [
            Expanded(
              flex: 18,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                child: Stack(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: const Offset(0, 8),
                          ),
                        ],
                            borderRadius:
                                const BorderRadius.all(Radius.circular(35)),
                            image: DecorationImage(
                                image: photo, fit: BoxFit.cover))),
                    Container(
                        decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(35)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color.fromARGB(150, 0, 0, 0),
                            Colors.transparent
                          ]),
                    )),
                    Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            width: 6.w,
                            height: 6.w,
                            child: const Icon(
                              Icons.download_for_offline_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            width: 6.w,
                            height: 6.w,
                            child: const Icon(
                              Icons.bookmark_border_outlined,
                              color: Colors.black,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                description,
                style:
                    GoogleFonts.notoSans(color: Colors.white, fontSize: 10.sp),
              ),
            )
          ],
        ));
  }
}
