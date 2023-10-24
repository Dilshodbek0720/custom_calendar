import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Calendar"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            TableCalendar(
              focusedDay: today,
              locale: "en_Us",
              // rowHeight: 48,
              headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                  // headerMargin: EdgeInsets.symmetric(horizontal: 6),
                  formatButtonShowsNext: true),
              calendarStyle: const CalendarStyle(
                  withinRangeTextStyle: TextStyle(color: Colors.red),
                  weekNumberTextStyle: TextStyle(color: Colors.red),
                  // weekendTextStyle: TextStyle(color: Colors.red,),
                  // selectedTextStyle: TextStyle(color: Colors.red),
                  rangeStartTextStyle: TextStyle(color: Colors.red),
                  rangeEndTextStyle: TextStyle(color: Colors.red),
                  todayTextStyle: TextStyle(color: Colors.white),
                  holidayTextStyle: TextStyle(color: Colors.red)),
              holidayPredicate: (day) => (day.day == 31 && day.month == 12),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              onDaySelected: _onDaySelected,
              firstDay: DateTime(2010, 12, 12),
              lastDay: DateTime(2023, 12, 12),
            )
          ],
        ),
      ),
    );
  }
}
