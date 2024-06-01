import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project_app/theme.dart';

class PtsAdviceTab extends StatelessWidget {
  const PtsAdviceTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              "Movement Tips",
              style: GoogleFonts.lato(fontSize: 20, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          const MovementTipsSection(),
          Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Explore:",
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3.h,
                ),
                Wrap(
                  runSpacing: 1.5.h,
                  children: const [
                    ExploreSectionWidget(
                      title: "Movement",
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    ExploreSectionWidget(
                      title: "Nutrition",
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    ExploreSectionWidget(
                      title: "Awareness",
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ExploreSectionWidget extends StatelessWidget {
  const ExploreSectionWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      splashColor: Colors.white.withOpacity(0.1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold),
          ),
          const Icon(Icons.arrow_forward_ios_outlined)
        ],
      ),
    );
  }
}

class MovementTipsSection extends StatelessWidget {
  const MovementTipsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: themeBackground,
      height: 40.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          MovementsTipsWidget(
            image: AssetImage("assets/images/brain.jpeg"),
            title: "What does \"listening to the body's voice\" mean?",
          ),
          MovementsTipsWidget(
            image: AssetImage("assets/images/gym.jpeg"),
            title: "Discover the best moves for yourself",
          ),
        ],
      ),
    );
  }
}

class MovementsTipsWidget extends StatelessWidget {
  const MovementsTipsWidget({
    super.key,
    required this.title,
    required this.image,
  });
  final String title;
  final ImageProvider image;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      width: 70.w,
      color: themeBackground,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 5,
                child: Padding(
                  padding: EdgeInsets.all(3.w),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image:
                            DecorationImage(fit: BoxFit.cover, image: image)),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Text(
                  title,
                  style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
