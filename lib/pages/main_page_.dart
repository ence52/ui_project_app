import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ui_project_app/pages/sign_in_page.dart';
import 'package:ui_project_app/pages/tabs/pts_advice_tab.dart';
import 'package:ui_project_app/theme.dart';
import 'tabs/activities_tab.dart';
import 'tabs/for_you_tab.dart';
import 'tabs/search_tab.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: themeBackground,
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: Text(
            "Workouts",
            style: GoogleFonts.lato(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12.sp),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.bookmark_border_outlined),
              iconSize: 16.sp,
            ),
          ],
          bottom: createTabBar(),
        ),
        body: createTabBarView(),
      ),
    );
  }

  TabBarView createTabBarView() {
    return const TabBarView(
      children: [
        ForYouTab(),
        SearchTab(),
        PtsAdviceTab(),
        ActivitiesTab(),
      ],
    );
  }

  TabBar createTabBar() {
    return const TabBar(
      tabs: [
        Tab(
          text: "For You",
        ),
        Tab(
          text: "Search",
        ),
        Tab(
          text: "PT's Advice",
        ),
        Tab(
          text: "Activities",
        ),
      ],
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 70.w,
      backgroundColor: const Color.fromARGB(220, 255, 255, 255),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CircleAvatar(
                radius: 6.w,
                foregroundImage: const AssetImage("assets/images/stewie.png"),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Erkan Ince",
                style: GoogleFonts.lato(
                    fontSize: 14.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            const DrawerDivider(),
            const DrawerListTile(
              icon: Icons.timelapse,
              title: "Workouts",
            ),
            const DrawerListTile(
              icon: Icons.calendar_month_sharp,
              title: "Programs",
            ),
            const DrawerListTile(
              icon: Icons.menu_book_outlined,
              title: "Main Menu",
            ),
            const DrawerListTile(
              icon: Icons.bookmark_border,
              title: "Saved Workouts",
            ),
            const DrawerListTile(
              icon: Icons.add_chart_outlined,
              title: "Activities",
            ),
            const DrawerListTile(
              icon: Icons.mail_outline_outlined,
              title: "Mail Box",
            ),
            const DrawerDivider(),
            const DrawerListTile(
              icon: Icons.settings,
              title: "Settings",
            ),
            DrawerListTile(
              icon: Icons.logout,
              function: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SignInPage(
                            checkBoxBool: false,
                          )),
                );
              },
              title: "Log Out",
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    this.function,
  });
  final String title;
  final IconData icon;
  final Function()? function;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: function,
      iconColor: Colors.black,
      leading: Icon(
        icon,
      ),
      title: Text(
        title,
        style: GoogleFonts.lato(
            fontSize: 11.sp, color: Colors.black, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class DrawerDivider extends StatelessWidget {
  const DrawerDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Divider(
        thickness: 1.5,
        color: themeDarkGrey,
      ),
    );
  }
}
