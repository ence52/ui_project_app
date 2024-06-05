import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project_app/theme.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeBackground,
      padding: EdgeInsets.only(top: 4.h),
      child: Wrap(runSpacing: 5.h, children: [
        createSearchField(),
        const PopularWorkoutsSection(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          height: 30.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Most saved workouts",
                style: GoogleFonts.lato(
                    fontSize: 15.sp,
                    color: tabBarSelected,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 25.h,
                child: const Wrap(
                  runAlignment: WrapAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BestForYouWidget(
                          level: "Beginner",
                          photo: AssetImage("assets/images/crunch.png"),
                          time: "10",
                          title: "Belly fat\nburner",
                        ),
                        BestForYouWidget(
                          level: "Beginner",
                          photo: AssetImage("assets/images/squat.png"),
                          time: "10",
                          title: "Lose Fat",
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BestForYouWidget(
                          level: "Expert",
                          photo: AssetImage("assets/images/plank.png"),
                          time: "5",
                          title: "Plank",
                        ),
                        BestForYouWidget(
                          level: "Expert",
                          photo: AssetImage("assets/images/biceps.png"),
                          time: "10",
                          title: "Build \nBiceps",
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ]),
    );
  }

  Padding createSearchField() {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, right: 6.w),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 6.w,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
        ),
      ),
    );
  }
}

class BestForYouWidget extends StatelessWidget {
  const BestForYouWidget({
    super.key,
    required this.photo,
    required this.title,
    required this.time,
    required this.level,
  });
  final ImageProvider photo;
  final String title;
  final String time;
  final String level;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.w,
      width: 45.w,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3), // Gölgenin rengi
          spreadRadius: 2, // Gölgenin yayılma alanı
          blurRadius: 10, // Gölgenin bulanıklık derecesi
          offset: const Offset(0, 8), // Gölgenin x ve y eksenlerinde kayması
        ),
      ], borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Stack(children: [
              Container(
                margin: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(fit: BoxFit.cover, image: photo),
                ),
              ),
              Container(
                margin: EdgeInsets.all(1.w),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color.fromARGB(120, 0, 0, 0),
                        Colors.transparent
                      ]),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ]),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(0.2.w),
              child: Wrap(
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.start,
                spacing: 7,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.7.w),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 215, 215),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "$time Min",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 0.7.w),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 215, 215),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      level,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PopularWorkoutsSection extends StatelessWidget {
  const PopularWorkoutsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: Text(
            "Popular Workouts",
            style: TextStyle(
                fontSize: 15.sp,
                color: tabBarSelected,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        SizedBox(
          height: 28.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              SizedBox(
                width: 6.w,
              ),
              const SearchPopWorksBox(
                time: "50",
                kcal: "500",
                title: "Lower Body\nTraining",
                image: AssetImage("assets/images/lowerBody2.png"),
              ),
              const SearchPopWorksBox(
                time: "25",
                kcal: "200",
                title: "Yoga         \n",
                image: AssetImage("assets/images/yoga2.png"),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class SearchPopWorksBox extends StatelessWidget {
  const SearchPopWorksBox({
    super.key,
    required this.title,
    required this.kcal,
    required this.time,
    required this.image,
  });
  final String title;
  final String kcal;
  final String time;
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 6.w, bottom: 4.h),
      child: Stack(
        children: [
          Container(
            width: 70.w,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 8),
                ),
              ],
              borderRadius: const BorderRadius.all(Radius.circular(35)),
              image: DecorationImage(image: image, fit: BoxFit.cover),
            ),
          ),
          Container(
            width: 70.w,
            decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.black, Colors.transparent]),
              borderRadius: BorderRadius.all(Radius.circular(35)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Stack(alignment: Alignment.center, children: [
                      Container(
                        width: 18.w,
                        height: 5.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(200, 255, 255, 255),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.local_fire_department,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 1.h,
                          ),
                          Text(
                            "$kcal Kcal",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 8.sp,
                                color: Colors.black),
                          ),
                        ],
                      )
                    ]),
                    SizedBox(
                      height: 1.5.h,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          width: 18.w,
                          height: 5.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(200, 255, 255, 255),
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_alarm,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 1.h,
                            ),
                            Text(
                              "$time Min",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8.sp,
                                  color: Colors.black),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(200, 95, 95, 95),
                    borderRadius: BorderRadius.circular(50)),
                height: 8.w,
                width: 8.w,
                child: const Icon(
                  Icons.play_arrow,
                  color: Color.fromARGB(200, 255, 255, 255),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
