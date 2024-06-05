import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:ui_project_app/theme.dart';

class ActivitiesTab extends StatefulWidget {
  const ActivitiesTab({
    super.key,
  });

  @override
  State<ActivitiesTab> createState() => _ActivitiesTabState();
}

class _ActivitiesTabState extends State<ActivitiesTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SfCalendar(
            onTap: (calendarTapDetails) => {
              if (calendarTapDetails.targetElement ==
                  CalendarElement.appointment)
                {
                  showDialog(
                      context: context,
                      builder: (_) => const AppointmentDetailsAlertDialog())
                }
              else
                {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddActivityPage()))
                },
            },
            dataSource: MeetingDataSource(_getDataSource()),
            view: CalendarView.week,
            backgroundColor: themeBackground,
            firstDayOfWeek: 3,
            appointmentTextStyle: TextStyle(fontSize: 8.sp),
            headerStyle: CalendarHeaderStyle(
              textAlign: TextAlign.center,
              textStyle: TextStyle(fontSize: 14.sp),
            ),
            headerDateFormat:
                "${DateTime.now().add(const Duration(hours: 3)).day} MMMM yy",
            todayHighlightColor: themeGreen,
            selectionDecoration:
                const BoxDecoration(color: Color.fromARGB(255, 39, 52, 59)),
            viewHeaderStyle: ViewHeaderStyle(
                dayTextStyle: TextStyle(fontSize: 10.sp),
                dateTextStyle: TextStyle(fontSize: 10.sp)),
            timeSlotViewSettings:
                TimeSlotViewSettings(timeTextStyle: TextStyle(fontSize: 8.sp)),
            showCurrentTimeIndicator: false,
            scheduleViewSettings: const ScheduleViewSettings(
                weekHeaderSettings:
                    WeekHeaderSettings(backgroundColor: Colors.pink)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Container(
            color: themeBackground,
            width: double.infinity,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const WidgetStatePropertyAll(themeGreen),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)))),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddActivityPage()),
                );
              },
              child: Text(
                "Add Activity",
                style: GoogleFonts.lato(
                    fontSize: 12.sp, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = [];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 7);
    final DateTime endTime = startTime.add(const Duration(hours: 1));
    meetings.add(
        Meeting('Yoga', startTime, endTime, const Color(0xFF0F8644), false));
    meetings.add(Meeting(
        'Leg Workout',
        DateTime(2024, 6, today.day + 3, 10, 0, 0),
        DateTime(2024, 6, today.day + 3, 11, 0, 0),
        const Color.fromARGB(255, 131, 78, 216),
        false));
    meetings.add(Meeting(
        'Cardio',
        DateTime(2024, 6, today.day + 2, 10, 0, 0),
        DateTime(2024, 6, today.day + 2, 12, 0, 0),
        const Color.fromARGB(255, 0, 105, 135),
        false));
    meetings.add(Meeting(
        'Upper Body Workout',
        DateTime(2024, 6, today.day + 5, 14, 0, 0),
        DateTime(2024, 6, today.day + 5, 16, 0, 0),
        const Color.fromARGB(255, 176, 138, 1),
        false));
    return meetings;
  }
}

class AppointmentDetailsAlertDialog extends StatelessWidget {
  const AppointmentDetailsAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      backgroundColor: themeGreen,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      title: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 2.5.w,
          ),
          Text("Workout Schedule",
              style: GoogleFonts.lato(
                  fontSize: 10.sp, fontWeight: FontWeight.w900)),
        ],
      ),
      content: SizedBox(
        height: 10.h,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Yoga",
                  style: GoogleFonts.lato(
                      fontSize: 10.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 1.h,
              ),
              Row(
                children: [
                  const Icon(Icons.watch_later_outlined),
                  SizedBox(
                    width: 2.5.w,
                  ),
                  Text("Today | 07:00AM",
                      style: GoogleFonts.lato(color: Colors.white))
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
              overlayColor: const Color.fromARGB(200, 0, 0, 0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              side: const BorderSide(width: 1.0, color: Colors.white),
            ),
            onPressed: () {},
            child: Text(
              "Mark As Done",
              style: GoogleFonts.lato(color: Colors.white),
            ))
      ],
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}

class AddActivityPage extends StatefulWidget {
  const AddActivityPage({super.key});

  @override
  State<AddActivityPage> createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  TimeOfDay timeOfDay = TimeOfDay.now();
  String date = DateFormat.yMMMMEEEEd()
      .format(DateTime.now().add(const Duration(hours: 3)));
  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().add(const Duration(hours: 3));
    String time = DateFormat('h:mm a').format(now);
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: GoogleFonts.lato(
            color: tabBarSelected,
            fontSize: 12.sp,
            fontWeight: FontWeight.bold),
        elevation: 0,
        backgroundColor: themeBackground,
        centerTitle: true,
        title: const Text("Add Activities"),
      ),
      body: Container(
        color: themeBackground,
        alignment: Alignment.center,
        padding: EdgeInsets.all(5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            createDateSection(),
            SizedBox(height: 4.h),
            Text(
              "Time",
              style: GoogleFonts.lato(
                  fontSize: 12.sp,
                  color: tabBarSelected,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) => Center(
                          child: Container(
                            decoration: BoxDecoration(
                                color: themeBackground,
                                borderRadius: BorderRadius.circular(25)),
                            height: 40.w,
                            width: 70.w,
                            child: SizedBox(
                              height: 15.w,
                              child: Center(
                                child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.time,
                                    initialDateTime: DateTime.now()
                                        .add(const Duration(hours: 3)),
                                    onDateTimeChanged: (val) {}),
                              ),
                            ),
                          ),
                        ));
              },
              child: Center(
                child: Text(
                  time,
                  style: GoogleFonts.lato(color: Colors.white, fontSize: 26.sp),
                ),
              ),
            ),
            createWorkOutDetailsSection(),
            createSaveButton()
          ],
        ),
      ),
    );
  }

  Padding createSaveButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 7.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 12),
          ),
        ], color: themeGreen, borderRadius: BorderRadius.circular(40)),
        child: Text(
          "Save",
          style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Container createWorkOutDetailsSection() {
    return Container(
      padding: EdgeInsets.all(4.w),
      height: 45.h,
      child: Wrap(
        runSpacing: 2.h,
        children: [
          Text(
            "Workout Details",
            style: GoogleFonts.lato(color: tabBarSelected, fontSize: 14.sp),
          ),
          const DetailsWorkOutWidget(
            svg: "assets/icons/dumbell.svg",
            title: "Choose Workout",
            chosenWorkout: "Upper Body Workout",
          ),
          const DetailsWorkOutWidget(
            icon: Icons.swap_vert,
            title: "Difficulty",
            chosenWorkout: "Beginner",
          ),
          const DetailsWorkOutWidget(
            icon: Icons.repeat,
            title: "Custom Repetitions",
            chosenWorkout: "",
          ),
          const DetailsWorkOutWidget(
            svg: "assets/icons/weight.svg",
            title: "Custom Weigths",
            chosenWorkout: "",
          ),
        ],
      ),
    );
  }

  Row createDateSection() {
    return Row(
      children: [
        const Icon(Icons.date_range),
        SizedBox(
          width: 2.w,
        ),
        Text(
          date,
          style: GoogleFonts.lato(fontSize: 10.sp, color: Colors.white),
        )
      ],
    );
  }
}

class DetailsWorkOutWidget extends StatelessWidget {
  const DetailsWorkOutWidget({
    super.key,
    required this.title,
    required this.chosenWorkout,
    this.svg,
    this.icon,
  });
  final String title;
  final String? chosenWorkout;
  final String? svg;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
      height: 6.h,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 10,
          offset: const Offset(0, 8),
        ),
      ], borderRadius: BorderRadius.circular(20), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: svg != null
                    ? SvgPicture.asset(
                        "$svg",
                        width: 4.w,
                        height: 4.w,
                      )
                    : Icon(
                        icon,
                        color: Colors.black,
                      ),
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                title,
                style: GoogleFonts.lato(
                    color: themeDarkGrey,
                    fontSize: 9.5.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                chosenWorkout ?? "",
                style: GoogleFonts.lato(color: themeDarkGrey, fontSize: 8.sp),
              ),
              SizedBox(
                width: 1.w,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: themeDarkGrey,
                size: 12.sp,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({
    super.key,
  });

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () async {
            final TimeOfDay? timeOfDay = await showTimePicker(
                helpText: "Select a time",
                context: context,
                initialTime: selectedTime,
                initialEntryMode: TimePickerEntryMode.inputOnly);
            if (timeOfDay != null) {
              setState(() {
                selectedTime = timeOfDay;
              });
            }
          },
          child: Text(
            "${selectedTime.hour}:${selectedTime.minute}",
            style: TextStyle(fontSize: 25.sp, color: tabBarSelected),
          )),
    );
  }
}
